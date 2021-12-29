// state controller for on chip mem VRAM

module control(input logic Clk, AVL_READ, AVL_WRITE, RESET, 
				output logic W, R, getchar
			   );
	
	enum logic [2:0] {Reset, Read, Write, Fetch} curr_state, next_state;


	// default logic for states
	always_ff @ (posedge Clk) begin
		if(RESET)
			curr_state = Reset;
		else
			curr_state = next_state;
	end

	// next state logic
	always_comb begin
		next_state = curr_state;
		unique case(curr_state)
			Reset: begin
				if(AVL_READ)
					next_state = Read;
				if(AVL_WRITE)
					next_state = Write;
				else
					next_state = curr_state;
			end

			Read: begin
				if(AVL_WRITE)
					next_state = Write;
				else begin
					if(AVL_READ==1'b0)
						next_state = Fetch;
				end
			end
			Write: begin if(AVL_READ)
					next_state = Read;
					else begin
						if(AVL_WRITE==1'b0)
							next_state = Fetch;
					end
				end

			Fetch: begin if(AVL_READ)
					next_state = Read;
					if(AVL_WRITE)
					next_state = Write;
					else 
						next_state = curr_state;
					end
		endcase
	end


	//control signals
		always_comb begin
		R = 1'b0;
		W = 1'b0;
		getchar = 1'b0;
		unique case(curr_state)
			Reset: ;

			Read: begin
			R = 1'b1;
			end

			Write: begin 
				W = 1'b1;
			end

			Fetch: begin 
				getchar = 1'b1;
			end
		endcase
	end


endmodule