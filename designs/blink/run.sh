cat > build.tcl <<EOF
read_verilog [glob ./blink.srcs/*.v]
read_xdc ./blink.srcs/blink.xdc
synth_design -top blink -part xcku5p-ffvb676-2-i
opt_design
place_design
route_design
write_bitstream -force blink.bit
open_hw_manager
connect_hw_server
open_hw_target
current_hw_device [lindex [get_hw_devices] 0]
refresh_hw_device [current_hw_device]
set_property PROGRAM.FILE {blink.bit} [current_hw_device]
program_hw_devices [current_hw_device]
close_hw_target
close_hw_manager
puts "Programmed successfully"
EOF

vivado -mode batch -source build.tcl 2>&1 | tee build.log
