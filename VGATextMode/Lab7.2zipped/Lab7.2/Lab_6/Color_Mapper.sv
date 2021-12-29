
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


module  color_mapper ( input        [9:0] DrawX, DrawY,
								input logic [7:0] fontdata, input logic invert,
								input logic [11:0] FGD, BGD,
                       output logic [7:0]  Red, Green, Blue );
    
    logic ball_on, shape_on, shape2_on;
    logic [10:0] sprite_addr;
    logic [10:0] shape_y;
    logic [10:0] shape_x;
    logic [10:0] shape_size_x = 8;
    logic [10:0] shape_size_y = 16;
    logic [10:0] shape2_y;
    logic [10:0] shape2_x;
    logic [10:0] shape2_size_x = 8;
    logic [10:0] shape2_size_y = 16;

	 
 /* Old Ball: Generated square box by cecking if the current pixel is within a square of length
    2*Ball_Size, centered at (BallX, BallY).  Note that this requires unsigned comparisons.
	 
    if ((DrawX >= BallX - Ball_size) &&
       (DrawX <= BallX + Ball_size) &&
       (DrawY >= BallY - Ball_size) &&
       (DrawY <= BallY + Ball_size))

     New Ball: Generates (pixelated) circle by using the standard circle formula.  Note that while 
     this single line is quite powerful descriptively, it causes the synthesis tool to use up three
     of the 12 available multipliers on the chip!  Since the multiplicants are required to be signed,
	  we have to first cast them from logic to int (signed by default) before they are multiplied). */
	  
    logic [10:0] font_addr;
	 logic[7:0] sprite_data;
	 assign sprite_data = fontdata;

    
	  

endmodule
