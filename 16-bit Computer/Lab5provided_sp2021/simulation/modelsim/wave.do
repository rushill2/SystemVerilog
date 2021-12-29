onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/Continue
add wave -noupdate /testbench/SW
add wave -noupdate /testbench/LED
add wave -noupdate /testbench/HEX0
add wave -noupdate /testbench/HEX1
add wave -noupdate /testbench/HEX2
add wave -noupdate /testbench/HEX3
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/Continue
add wave -noupdate /testbench/SW
add wave -noupdate /testbench/LED
add wave -noupdate /testbench/check/slc/d0/MIO_EN
add wave -noupdate /testbench/HEX0
add wave -noupdate /testbench/HEX1
add wave -noupdate /testbench/HEX2
add wave -noupdate /testbench/HEX3
add wave -noupdate /testbench/check/slc/d0/MAR
add wave -noupdate /testbench/check/slc/d0/PC
add wave -noupdate -radix hexadecimal /testbench/check/slc/d0/MDR
add wave -noupdate /testbench/check/slc/d0/IR
add wave -noupdate -radix hexadecimal /testbench/check/slc/d0/Bus
add wave -noupdate /testbench/check/slc/state_controller/State
add wave -noupdate /testbench/check/slc/d0/gpr/out_r0
add wave -noupdate -radix hexadecimal /testbench/check/slc/d0/gpr/out_r1
add wave -noupdate /testbench/check/slc/d0/gpr/out_r2
add wave -noupdate /testbench/check/slc/d0/gpr/out_r3
add wave -noupdate /testbench/check/slc/d0/gpr/out_r4
add wave -noupdate /testbench/check/slc/d0/gpr/out_r5
add wave -noupdate /testbench/check/slc/d0/gpr/out_r6
add wave -noupdate /testbench/check/slc/d0/gpr/out_r7
add wave -noupdate /testbench/check/slc/ADDR
add wave -noupdate /testbench/check/slc/WE
add wave -noupdate /testbench/check/slc/d0/ALUK
add wave -noupdate -radix hexadecimal /testbench/check/slc/d0/ALU_out
add wave -noupdate /testbench/check/slc/d0/Adder
add wave -noupdate /testbench/check/slc/d0/SR1_OUT
add wave -noupdate /testbench/check/slc/memory_subsystem/Data_from_CPU
add wave -noupdate /testbench/check/slc/memory_subsystem/hex_data
add wave -noupdate {/testbench/check/slc/hex_drivers[0]/In0}
add wave -noupdate {/testbench/check/slc/hex_drivers[1]/In0}
add wave -noupdate {/testbench/check/slc/hex_drivers[2]/In0}
add wave -noupdate {/testbench/check/slc/hex_drivers[3]/In0}
add wave -noupdate -radix hexadecimal /testbench/check/slc/MDR_In
add wave -noupdate /testbench/check/slc/d0/GateALU
add wave -noupdate /testbench/check/slc/d0/GateMARMUX
add wave -noupdate /testbench/check/slc/d0/GateMDR
add wave -noupdate /testbench/check/slc/d0/GatePC
add wave -noupdate /testbench/check/slc/state_controller/SR1MUX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1278929 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 312
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {961812 ps} {1475694 ps}
