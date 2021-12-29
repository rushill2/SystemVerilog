onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/SW
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/Continue
add wave -noupdate /testbench/LED
add wave -noupdate /testbench/IR_out
add wave -noupdate /testbench/PC
add wave -noupdate /testbench/SR1
add wave -noupdate /testbench/MAR
add wave -noupdate /testbench/MDR
add wave -noupdate /testbench/HEX_outb
add wave -noupdate /testbench/OE
add wave -noupdate /testbench/WE
add wave -noupdate /testbench/ErrorCnt
add wave -noupdate /testbench/computer/slc/state_controller/State
add wave -noupdate /testbench/computer/slc/d0/MAR
add wave -noupdate /testbench/computer/slc/d0/MDR
add wave -noupdate /testbench/computer/slc/d0/MIO_EN
add wave -noupdate /testbench/computer/slc/d0/PC
add wave -noupdate /testbench/computer/slc/d0/IR
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {1182592 ps}
