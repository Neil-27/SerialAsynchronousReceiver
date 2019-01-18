onerror {quit -f}
vlib work
vlog -work work SerialAsynchronousReceiver.vo
vlog -work work SerialAsynchronousReceiver.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DemoTop_vlg_vec_tst
vcd file -direction SerialAsynchronousReceiver.msim.vcd
vcd add -internal DemoTop_vlg_vec_tst/*
vcd add -internal DemoTop_vlg_vec_tst/i1/*
add wave /*
run -all
