module mazewalls (input [10:0]  DrawX, DrawY,	
							output logic is_wall
							);
	always_comb begin

		// boundaries for the entire maze
		if(DrawY <= 10'd16 && (DrawX<10'd277 || DrawX>10'd300)) begin is_wall = 1'b1; end
		else if (DrawX < 10'd12) begin is_wall = 1'b1; end
		else if (DrawY > 10'd473) begin is_wall = 1'b1; end
		else if (DrawX > 10'd627) begin is_wall = 1'b1; end // buggy, does not show up

		// end boundaries 
		
		// begin from top left
		// top branch followed by bottom.

		// LEFT HALF
		else if (DrawX > 10'd99 && DrawX < 10'd103 && DrawY > 10'd5 && DrawY < 10'd33) begin
		is_wall = 1'b1;
		end
		else if (DrawX > 10'd57 && DrawX < 10'd103 && DrawY > 10'd31 && DrawY < 10'd35) begin is_wall = 1'b1;
	end	
		else if (DrawX > 10'd57 && DrawX < 10'd61 && DrawY > 10'd31 && DrawY < 10'd61) begin is_wall = 1'b1;
	end	
		else if (DrawX > 10'd57 && DrawX < 10'd145 && DrawY > 10'd57 && DrawY < 10'd62) begin is_wall = 1'b1;
	end	
		else if (DrawX > 10'd144 && DrawX < 10'd149 && DrawY > 10'd31 && DrawY < 10'd62) begin is_wall = 1'b1;
	end
	
	else if (DrawX > 10'd144 && DrawX < 10'd149 && DrawY > 10'd61 && DrawY < 10'd86) begin is_wall = 1'b1;
	end	
	
	
	else if (DrawX > 10'd144 && DrawX < 10'd191 && DrawY > 10'd83 && DrawY < 10'd87) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd144 && DrawX < 10'd234 && DrawY > 10'd31 && DrawY < 10'd35) begin is_wall = 1'b1;
	end	


	else if (DrawX > 10'd231 && DrawX < 10'd235 && DrawY > 10'd31 && DrawY < 10'd62) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd231 && DrawX < 10'd276 && DrawY > 10'd57 && DrawY < 10'd62) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd274 && DrawX < 10'd278 && DrawY > 10'd32 && DrawY < 10'd139) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd101 && DrawX < 10'd235 && DrawY > 10'd108 && DrawY < 10'd112) begin is_wall = 1'b1;
	end	


	else if (DrawX > 10'd99 && DrawX < 10'd102 && DrawY > 10'd83 && DrawY < 10'd138) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd102 && DrawY > 10'd84 && DrawY < 10'd88) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd61 && DrawY > 10'd84 && DrawY < 10'd111) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd11 && DrawX < 10'd61 && DrawY > 10'd108 && DrawY < 10'd111) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd144 && DrawX < 10'd276 && DrawY > 10'd136 && DrawY < 10'd141) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd144 && DrawX < 10'd276 && DrawY > 10'd161 && DrawY < 10'd165) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd144 && DrawX < 10'd149 && DrawY > 10'd136 && DrawY < 10'd190) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd99 && DrawX < 10'd146 && DrawY > 10'd187 && DrawY < 10'd191) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd99 && DrawX < 10'd102 && DrawY > 10'd161 && DrawY < 10'd191) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd103 && DrawY > 10'd161 && DrawY < 10'd165) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd274 && DrawX < 10'd278 && DrawY > 10'd161 && DrawY < 10'd191) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd230 && DrawX < 10'd278 && DrawY > 10'd187 && DrawY < 10'd191) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd231 && DrawX < 10'd235 && DrawY > 10'd187 && DrawY < 10'd219) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd231 && DrawX < 10'd278 && DrawY > 10'd187 && DrawY < 10'd191) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd187 && DrawX < 10'd410 && DrawY > 10'd240 && DrawY < 10'd244) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd187 && DrawX < 10'd191 && DrawY > 10'd240 && DrawY < 10'd296) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd274 && DrawX < 10'd278 && DrawY > 10'd161 && DrawY < 10'd191) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd187 && DrawX < 10'd191 && DrawY > 10'd187 && DrawY < 10'd219) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd191 && DrawY > 10'd215 && DrawY < 10'd219) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd62 && DrawY > 10'd187 && DrawY < 10'd219) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd11 && DrawX < 10'd62 && DrawY > 10'd187 && DrawY < 10'd191) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd230 && DrawX < 10'd278 && DrawY > 10'd267 && DrawY < 10'd271) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd230 && DrawX < 10'd234 && DrawY > 10'd267 && DrawY < 10'd322) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd274 && DrawX < 10'd278 && DrawY > 10'd267 && DrawY < 10'd322) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd145 && DrawY > 10'd241 && DrawY < 10'd245) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd145 && DrawY > 10'd293 && DrawY < 10'd297) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd62 && DrawY > 10'd241 && DrawY < 10'd297) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd100 && DrawX < 10'd145 && DrawY > 10'd267 && DrawY < 10'd271) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd141 && DrawX < 10'd145 && DrawY > 10'd295 && DrawY < 10'd322) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd99 && DrawX < 10'd103 && DrawY > 10'd322 && DrawY < 10'd348) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd141 && DrawX < 10'd145 && DrawY > 10'd345 && DrawY < 10'd376) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd145 && DrawY > 10'd372 && DrawY < 10'd376) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd62 && DrawY > 10'd372 && DrawY < 10'd400) begin is_wall = 1'b1;
	end	
	
	else if (DrawX > 10'd316 && DrawX < 10'd321 && DrawY > 10'd267 && DrawY < 10'd350) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd187 && DrawX < 10'd191 && DrawY > 10'd347 && DrawY < 10'd400) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd187 && DrawX < 10'd234 && DrawY > 10'd396 && DrawY < 10'd400) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd230 && DrawX < 10'd234 && DrawY > 10'd372 && DrawY < 10'd400) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd230 && DrawX < 10'd365 && DrawY > 10'd373 && DrawY < 10'd377) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd362 && DrawX < 10'd366 && DrawY > 10'd347 && DrawY < 10'd425) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd62 && DrawY > 10'd424 && DrawY < 10'd455) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd57 && DrawX < 10'd102 && DrawY > 10'd424 && DrawY < 10'd428) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd99 && DrawX < 10'd102 && DrawY > 10'd397 && DrawY < 10'd425) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd99 && DrawX < 10'd145 && DrawY > 10'd397 && DrawY < 10'd401) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd141 && DrawX < 10'd145 && DrawY > 10'd400 && DrawY < 10'd455) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd141 && DrawX < 10'd191 && DrawY > 10'd424 && DrawY < 10'd428) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd99 && DrawX < 10'd191 && DrawY > 10'd451 && DrawY < 10'd455) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd231 && DrawX < 10'd235 && DrawY > 10'd453 && DrawY < 10'd478) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd316 && DrawX < 10'd321 && DrawY > 10'd453 && DrawY < 10'd478) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd230 && DrawX < 10'd279 && DrawY > 10'd423 && DrawY < 10'd427) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd275 && DrawX < 10'd279 && DrawY > 10'd399 && DrawY < 10'd453) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd230 && DrawX < 10'd278 && DrawY > 10'd214 && DrawY < 10'd218) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd274 && DrawX < 10'd278 && DrawY > 10'd214 && DrawY < 10'd277) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd231 && DrawX < 10'd235 && DrawY > 10'd84 && DrawY < 10'd111) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd187 && DrawX < 10'd191 && DrawY > 10'd59 && DrawY < 10'd87) begin is_wall = 1'b1;
	end		

	else if (DrawX > 10'd230 && DrawX < 10'd278 && DrawY > 10'd423 && DrawY < 10'd427) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd274 && DrawX < 10'd278 && DrawY > 10'd400 && DrawY < 10'd453) begin is_wall = 1'b1;
	end	
	
	else if (DrawX > 10'd274 && DrawX < 10'd322 && DrawY > 10'd400 && DrawY < 10'd404) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd318 && DrawX < 10'd322 && DrawY > 10'd400 && DrawY < 10'd425) begin is_wall = 1'b1;
	end	

	



	// RIGHT HALF OF MAZE	
	else if (DrawX > 10'd317 && DrawX < 10'd322 && DrawY > 10'd5 && DrawY < 10'd86) begin is_wall = 1'b1;
	end	

	else if (DrawX > 10'd317 && DrawX < 10'd410 && DrawY > 10'd82 && DrawY < 10'd86) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd363 && DrawX < 10'd410 && DrawY > 10'd57 && DrawY < 10'd61) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd363 && DrawX < 10'd367 && DrawY > 10'd32 && DrawY < 10'd61) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd407 && DrawX < 10'd453 && DrawY > 10'd32 && DrawY < 10'd36) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd453 && DrawY > 10'd32 && DrawY < 10'd140) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd493 && DrawX < 10'd497 && DrawY > 10'd5 && DrawY < 10'd58) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd537 && DrawX < 10'd541 && DrawY > 10'd32 && DrawY < 10'd86) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd540 && DrawY > 10'd84 && DrawY < 10'd88) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd537 && DrawX < 10'd585 && DrawY > 10'd32 && DrawY < 10'd36) begin is_wall = 1'b1;
	end

		else if (DrawX > 10'd537 && DrawX < 10'd541 && DrawY > 10'd32 && DrawY < 10'd86) begin is_wall = 1'b1;
	end

		else if (DrawX > 10'd499 && DrawX < 10'd585 && DrawY > 10'd108 && DrawY < 10'd112) begin is_wall = 1'b1;
	end

	
		else if (DrawX > 10'd581 && DrawX < 10'd585 && DrawY > 10'd36 && DrawY < 10'd112) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd410 && DrawY > 10'd57 && DrawY < 10'd86) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd316 && DrawX < 10'd320 && DrawY > 10'd108 && DrawY < 10'd164) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd316 && DrawX < 10'd366 && DrawY > 10'd136 && DrawY < 10'd140) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd316 && DrawX < 10'd415 && DrawY > 10'd108 && DrawY < 10'd112) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd494 && DrawX < 10'd628 && DrawY > 10'd136 && DrawY < 10'd140) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd581 && DrawX < 10'd585 && DrawY > 10'd136 && DrawY < 10'd164) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd316 && DrawX < 10'd540 && DrawY > 10'd160 && DrawY < 10'd164) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd316 && DrawX < 10'd320 && DrawY > 10'd187 && DrawY < 10'd218) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd316 && DrawX < 10'd410 && DrawY > 10'd214 && DrawY < 10'd218) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd410 && DrawY > 10'd214 && DrawY < 10'd243) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd493 && DrawX < 10'd497 && DrawY > 10'd187 && DrawY < 10'd218) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd539 && DrawY > 10'd241 && DrawY < 10'd245) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd453 && DrawY > 10'd214 && DrawY < 10'd245) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd316 && DrawX < 10'd453 && DrawY > 10'd187 && DrawY < 10'd191) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd453 && DrawY > 10'd161 && DrawY < 10'd191) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd539 && DrawY > 10'd215 && DrawY < 10'd219) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd535 && DrawX < 10'd539 && DrawY > 10'd161 && DrawY < 10'd191) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd535 && DrawX < 10'd585 && DrawY > 10'd187 && DrawY < 10'd191) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd581 && DrawX < 10'd585 && DrawY > 10'd187 && DrawY < 10'd243) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd535 && DrawX < 10'd539 && DrawY > 10'd241 && DrawY < 10'd322) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd362 && DrawX < 10'd366 && DrawY > 10'd241 && DrawY < 10'd322) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd496 && DrawY > 10'd266 && DrawY < 10'd270) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd410 && DrawY > 10'd266 && DrawY < 10'd296) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd492 && DrawX < 10'd496 && DrawY > 10'd266 && DrawY < 10'd296) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd453 && DrawY > 10'd292 && DrawY < 10'd296) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd581 && DrawX < 10'd585 && DrawY > 10'd266 && DrawY < 10'd296) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd581 && DrawX < 10'd628 && DrawY > 10'd292 && DrawY < 10'd296) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd581 && DrawX < 10'd585 && DrawY > 10'd321 && DrawY < 10'd348) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd410 && DrawY > 10'd321 && DrawY < 10'd348) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd410 && DrawY > 10'd373 && DrawY < 10'd401) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd496 && DrawY > 10'd373 && DrawY < 10'd377) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd492 && DrawX < 10'd496 && DrawY > 10'd347 && DrawY < 10'd377) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd537 && DrawX < 10'd541 && DrawY > 10'd347 && DrawY < 10'd377) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd537 && DrawX < 10'd585 && DrawY > 10'd373 && DrawY < 10'd377) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd581 && DrawX < 10'd585 && DrawY > 10'd373 && DrawY < 10'd401) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd493 && DrawX < 10'd585 && DrawY > 10'd397 && DrawY < 10'd401) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd493 && DrawX < 10'd497 && DrawY > 10'd399 && DrawY < 10'd454) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd497 && DrawY > 10'd450 && DrawY < 10'd454) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd453 && DrawY > 10'd399 && DrawY < 10'd454) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd453 && DrawY > 10'd423 && DrawY < 10'd427) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd537 && DrawX < 10'd541 && DrawY > 10'd424 && DrawY < 10'd479) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd537 && DrawX < 10'd585 && DrawY > 10'd422 && DrawY < 10'd426) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd449 && DrawX < 10'd539 && DrawY > 10'd241 && DrawY < 10'd245) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd362 && DrawX < 10'd410 && DrawY > 10'd450 && DrawY < 10'd454) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd406 && DrawX < 10'd410 && DrawY > 10'd450 && DrawY < 10'd478) begin is_wall = 1'b1;
	end

	else if (DrawX > 10'd581 && DrawX < 10'd585 && DrawY > 10'd424 && DrawY < 10'd454) begin is_wall = 1'b1;
	end

	else begin is_wall = 1'b0;  end
	end

endmodule