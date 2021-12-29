// Game State controller

// Reset state displays the start game prompt 

// Game state involves the maze escape game

// End state (TBA)

module gamestate(input logic Clk, RST, ENTER, Completed, ended,
                input logic [7:0] keycode,
                output logic StartEnable, GameEnable, EndState,
                output logic [1:0] state);

    enum logic [1:0] {Reset, Game, End} curr_state, next_state;
	 assign state = curr_state;
    // default next state logic
    always_ff @ (posedge Clk) begin
        if(RST)
            curr_state <= Reset;
        else
            curr_state <= next_state;
    end

    //next state logic for the game
    always_comb begin
        next_state = curr_state;
        unique case (curr_state)
            Reset: begin
                 if (keycode == 8'h28)
                    next_state = Game;
                else 
                    next_state = curr_state;
            end

            Game: begin
                if (ended)
                    next_state = End;
                else 
                    next_state = curr_state;
            end

            End: begin
                 if (keycode == 8'h2c)
                    next_state = Reset;
                else 
                    next_state = curr_state;
            end
        endcase
    end

    // control signals for states
    always_comb begin
        StartEnable = 1'b0;
        GameEnable = 1'b0;
        EndState = 1'b0;
        unique case (curr_state)
            Reset: begin
                StartEnable = 1'b1;
                GameEnable = 1'b0;
            end

            Game: begin
                StartEnable = 1'b0;
                GameEnable = 1'b1;
            end

            End: begin
                StartEnable = 1'b0;
                GameEnable = 1'b0;
                EndState = 1'b1;
            end
            
        endcase
    end

endmodule 