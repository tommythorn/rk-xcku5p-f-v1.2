create_clock -period 5.000 [get_ports sys_clk_p]
set_property PACKAGE_PIN T24 [get_ports sys_clk_p]
set_property PACKAGE_PIN U24 [get_ports sys_clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_n]

set_property PACKAGE_PIN K10 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

set_property PACKAGE_PIN H9 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]


set_property PACKAGE_PIN AB14 [get_ports sd_miso]
set_property IOSTANDARD LVCMOS33 [get_ports sd_miso]
set_property PACKAGE_PIN AA15 [get_ports sd_mosi]
set_property IOSTANDARD LVCMOS33 [get_ports sd_mosi]
set_property PACKAGE_PIN AB15 [get_ports sd_cs]
set_property IOSTANDARD LVCMOS33 [get_ports sd_cs]
set_property PACKAGE_PIN Y15 [get_ports sd_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sd_clk]

