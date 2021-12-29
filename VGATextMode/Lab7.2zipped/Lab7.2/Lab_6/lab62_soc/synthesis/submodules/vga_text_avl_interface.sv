/************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************/
`define NUM_REGS 8 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register
`define NUM_CODE 4
module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);



logic [31:0] palette [`NUM_REGS]; // Registers
logic [31:0] data;
logic hs_holder, vs_holder, VGA_Clk, sync, blank;
logic [9:0] DrawX, DrawY;
logic[9:0] reg_addr;
logic [9:0] drawY_shift;
logic [9:0] addr1;
logic [10:0] font_addr;
logic [11:0] FGD, BGD;
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
	 logic [10:0] x;
	 logic [10:0] y;
	 logic [10:0] index;
	 
	 assign shape_y = DrawY >> 4;
	 assign shape_x = DrawX >> 5;
	 assign shape2_y = DrawY >> 4;
	 assign shape2_x = DrawX >> 5;
	
	 assign y = DrawY >> 4;
	 assign x = DrawX >> 4;
	 assign index = (x + y*40);
	 logic addr_inv;
	 assign addr_inv = ~AVL_ADDR[11];
	 logic [31:0] color_plt;
	 logic [3:0] fgd_shift, bgd_shift;
	 assign bgd_shift = BGD_idx >> 1;
	 assign fgd_shift = FGD_idx >> 1;
	 logic [11:0] color1, color2;
	 
//---------------------------------------------------------------------------------------------------------------
// begin logic for palette
always_ff @ (posedge CLK) begin
	if(RESET) begin
		for(int i = 0; i<8; i++) begin
			palette[i] <= 0;
		end
	end
	else begin
		if(AVL_ADDR[11]==1'b1 && AVL_WRITE && AVL_CS) begin
			palette[AVL_ADDR[2:0]] <= AVL_WRITEDATA;
		end	
	end
end
logic [11:0] fgd_color, bgd_color;

// logic for getting foreground
always_comb begin 
	fgd_color = 4'b0;
	if(FGD_idx[0]==1'b0) begin
		fgd_color = palette[fgd_shift][12:1];
	end
	else if(FGD_idx[0]==1'b1) begin
		fgd_color = palette[fgd_shift][24:13];
	end
end

// logic for getting background color
always_comb begin 
	bgd_color = 4'b0;
	if(BGD_idx[0]==1'b0) begin
		bgd_color = palette[bgd_shift][12:1];
	end
	else if(BGD_idx[0]==1'b1) begin
		bgd_color = palette[bgd_shift][24:13];
	end
end

//--------------------------------------------------------------------------------------------------------------

// RAM inst
logic wren_;
assign wren_ = AVL_WRITE & AVL_CS & addr_inv;

ram_final ram(
	.byteena_a(AVL_BYTE_EN),
	.clock(CLK),
	.data(AVL_WRITEDATA),
	.rdaddress(index),
	.wraddress(AVL_ADDR),
	.wren(wren_),
	.q(AVL_READDATA));

 
//Declare submodules..e.g. VGA controller, ROMS, etc
logic [7:0] fontdata;
logic [7:0] rev_fontdata;

 font_rom rom(.addr(font_addr), 
 			.data(fontdata));

vga_controller vga1 (.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .DrawX(DrawX), .DrawY(DrawY), .pixel_clk(VGA_Clk), .blank(blank), .sync(sync));//handle drawing (may either be combinational or sequential - or both).

// parsing the 32-bit register
// assign font_addr = index;
logic invbit;
logic offset; 
logic [9:0] remaining;
logic [3:0] BGD_idx, FGD_idx;
assign offset = (DrawX % 16)>>3;
assign remaining = DrawY % 16;

// logic for which code to use based on DrawX
always_comb begin
	FGD_idx =  4'b0000;
	BGD_idx = 4'b0000;
	if(offset == 1'b0) begin
		font_addr[10:4] =  AVL_READDATA[14:8];
		FGD_idx =  AVL_READDATA[7:4];
		BGD_idx =  AVL_READDATA[3:0];
		invbit =  AVL_READDATA[15];
		font_addr[3:0] = remaining;
		end
		
	else begin
		FGD_idx =  AVL_READDATA[23:20];
		BGD_idx = AVL_READDATA[19:16];
		font_addr[10:4] =  AVL_READDATA[30:24];
		invbit =  AVL_READDATA[31];
		font_addr[3:0] = remaining;
		end

end


logic [9:0] flipped;
assign flipped = ~(DrawX%8);
//color mapper
    always_comb
    begin:Ball_on_proc
		if (DrawX >= shape_x && DrawY >= shape_y) 
        begin
            shape_on = 1'b1;
        end 

		  else begin
			shape_on = 1'b0;
		  end
     end 
       
    always_ff @ (posedge VGA_Clk)
    begin:RGB_Display
		  
        if(!blank==0) begin
			if ((shape_on == 1'b1) && fontdata[flipped]==1'b1) begin 
		  		if (invbit == 1'b0)
			begin
				red <= fgd_color[11:8];
				green <=fgd_color[7:4];
				blue <= fgd_color[3:0];
//				red <= 4'hF;
//				blue <= 4'hF;
//				green <= 4'hF;
			end
			else begin
				red <= bgd_color[11:8];
				green <= bgd_color[7:4];
				blue <= bgd_color[3:0];
			end
		  end
		  
		  else if ((shape_on == 1'b1) && fontdata[flipped]==1'b0) 
        begin 
		  if (invbit == 1'b0)
		  begin
				red <= bgd_color[11:8];
				green <=bgd_color[7:4];
				blue <= bgd_color[3:0];
            
        end
        else begin
				red <= fgd_color[11:8];
				green <=fgd_color[7:4];
				blue <= fgd_color[3:0];
		  end
		  end    
		end
	else begin
		red <= 4'h0;
		green <=  4'h0;
		blue <=  4'h0;
	end
    end 
    

endmodule