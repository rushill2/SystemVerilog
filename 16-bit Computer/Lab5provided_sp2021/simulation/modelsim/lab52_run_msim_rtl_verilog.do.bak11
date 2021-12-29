transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/ben.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/memreg.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/SLC3_2.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/sext.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/regfile.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/muxmodule.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/ALU.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/adder.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/Mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/ISDU.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/memory_contents.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/datapath.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/slc3.sv}
vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/Users/rushi/Desktop/WORK/Fall\ 21/ECE385/385SV/Lab5provided_sp2021 {C:/Users/rushi/Desktop/WORK/Fall 21/ECE385/385SV/Lab5provided_sp2021/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 2000 ns
