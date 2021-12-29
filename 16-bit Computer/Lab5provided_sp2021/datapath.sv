// DataPath for the SLC3

// Currently only contains the PC increment and IR load operations of the LC3-FSM

module datapath(input logic	Clk, Reset, Run, Continue,      									// State transition signals
	input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,					// load signals
	input logic SR2MUX, ADDR1MUX, MARMUX, DRMUX, SR1MUX,										// MUXes
	input logic GatePC, GateMDR, GateALU, GateMARMUX,											// Gate signals
	input logic MIO_EN,	
	input logic [9:0] SW,// Mem IO enable
	input logic [1:0] PCMUX, ADDR2MUX, ALUK,													// MUX selectors
	input logic [15:0] MDR_In, Data_to_SRAM,																	// MDR load val
	output logic [15:0] MDR, IR, PC,																// MDR and IR Regs
	output logic [15:0] MAR, 																	// MAR reg
	output logic [9:0] LED,																		// LED
	output logic BEN																			// Branch Enable
	);

	// TODO: Need to increment PC, Load MAR, MDR and IR - Week1

	// variables and PCMUX inputs initialized
	logic [15:0] next_PC;
	logic [15:0] Bus;							// Data Bus
	logic [15:0] temp;
	// Building the PCMUX - selects between PC+1, and Bus, and Adder Output
	
	logic [2:0] DR, SR1, SR2;
	logic [15:0] Adder;


	// PC register

memreg PCreg(.Din(next_PC), .Load(LD_PC), .Dout(PC), .*);
//PCMUX
always_comb begin
	case (PCMUX)
		2'b00: next_PC = PC + 16'd1;
		2'b01: next_PC = Bus;
		2'b10: next_PC = Adder;
		default: next_PC = 16'hx; 
	endcase
end

// Instruction register
// Load IR from the bus if its load signal is enabled
 memreg IRreg(.Din(MDR), .Load(LD_IR),
				.Dout(IR), .*);


// -----------------------------------------------------------------------------------------------------------
// Decides whether to choose Bus or MDR_In
logic [15:0] Din;
always_comb begin
	if (MIO_EN)
		Din <= MDR_In;
	else
		Din <= Bus;
end

// MDR Reg
 memreg MDRreg(.Din(Din), .Load(LD_MDR),
				.Dout(MDR), .*);
				

// MAR Reg
memreg MARreg(.Din(Bus), .Load(LD_MAR),
				.Dout(MAR), .*);

//-------------------------------------------------------------------------------------------------------------------------------
// Instantiate regfile
logic [15:0] SR1_OUT, SR2_OUT;
logic [2:0] DR_bits, SR1_bits, SR2_bits;
assign DR_bits = DR;
assign SR1_bits = SR1;
assign SR2_bits = SR2;

reg_unit gpr(.Din(Bus), .Reset(Reset), .Bus(Bus), .Clk(Clk), .LD_REG(LD_REG), .DR(DR_bits), .SR1(SR1_bits), .SR2(SR2_bits), .SR1_OUT(SR1_OUT), .SR2_OUT(SR2_OUT));

//------------------------------------------------------------------------------------------------------------------------------
logic [15:0] SR2val;
muxmodule regmux(.IR(IR), .SR2MUX(SR2MUX), .DRMUX(DRMUX), .SR2_OUT(SR2_OUT), .SR1MUX(SR1MUX), .DR(DR), .SR1(SR1), .SR2(SR2), .SR2val(SR2val));

//-------------------------------------------------------------------------------------------------------------------------------
// Adder
adder adderout(.ADDR2MUX(ADDR2MUX), .ADDR1MUX(ADDR1MUX), .IR(IR), .Adder(Adder), .next_PC(next_PC), .SR1_OUT(SR1_OUT), .SW(SW));

//------------------------------------------------------------------------------------------------------------------------------
// ALU inst
logic [15:0] ALU_out;
ALU alunit(.Clk(Clk), .GateALU(GateALU), .Reset(Reset), .Run(Run), .Continue(Continue),.IR(IR),.SR2MUX(SR2MUX), .ADDR1MUX(ADDR1MUX), .MARMUX(MARMUX), 
.DRMUX(DRMUX), .SR1MUX(SR1MUX),.PCMUX(PCMUX), .ADDR2MUX(ADDR2MUX), .ALUK(ALUK), .SR1_OUT(SR1_OUT), .SR2val(SR2val), .ALU_out(ALU_out));

// ----------------------------------------------------------------------------------------------------------------------------
// BEN logic

benfinder bigben(.*);

// ------------------------------------------------------------------------------------------------------------------------------
// Bus MUX

always_comb begin
	case ({GateALU, GateMARMUX, GatePC, GateMDR}) 
		4'b1000: Bus = ALU_out;
		4'b0100: Bus = Adder;
		4'b0010: Bus = PC;
		4'b0001: Bus = MDR;
		default: Bus = 16'hx; 
	endcase
end

assign LED = IR[9:0];

endmodule