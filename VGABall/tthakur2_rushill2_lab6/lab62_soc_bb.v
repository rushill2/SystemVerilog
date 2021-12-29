
module lab62_soc (
	accumulate_wire_export,
	clk_clk,
	reset_reset_n,
	reset_wire_export,
	sdram_clk_clk,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	keycode_export,
	usb_irq_export,
	usb_gpx_export,
	usb_rst_export,
	hex_digits_export,
	leds_export,
	key_external_connection_export,
	spi_0_MISO,
	spi_0_MOSI,
	spi_0_SCLK,
	spi_0_SS_n);	

	input	[7:0]	accumulate_wire_export;
	input		clk_clk;
	input		reset_reset_n;
	input	[7:0]	reset_wire_export;
	output		sdram_clk_clk;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	output	[7:0]	keycode_export;
	input		usb_irq_export;
	input		usb_gpx_export;
	output		usb_rst_export;
	output	[15:0]	hex_digits_export;
	output	[13:0]	leds_export;
	input	[1:0]	key_external_connection_export;
	input		spi_0_MISO;
	output		spi_0_MOSI;
	output		spi_0_SCLK;
	output		spi_0_SS_n;
endmodule
