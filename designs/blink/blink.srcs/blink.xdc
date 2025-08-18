# this is the constraints

# PL_CLK, a 50 MHz clock (doesn't work on my board)
# create_clock -period 20.0        [get_ports "pl_clk50"]
# set_property IOSTANDARD LVCMOS33 [get_ports "pl_clk50"]
# set_property PACKAGE_PIN AC13    [get_ports "pl_clk50"]

# SYS CLK 200 MHz
set_property PACKAGE_PIN T24 [ get_ports "sys_clk_p" ]
set_property PACKAGE_PIN U24 [ get_ports "sys_clk_n" ]
set_property IOSTANDARD DIFF_SSTL12 [ get_ports "sys_clk_p" ]
set_property IOSTANDARD DIFF_SSTL12 [ get_ports "sys_clk_n" ]
create_clock -period 5.0 [get_ports "sys_clk_p"]

# QSFP28 CLK 156.25 MHz
# create_clock -period 6.05 [get_ports "gt_clk156p25_p"]
# TBD, NOT THIS set_property IOSTANDARD DIFF_SSTL12 [ get_ports "gt_clk156p25_p" ]
# TBD, NOT THIS set_property IOSTANDARD DIFF_SSTL12 [ get_ports "gt_clk156p25_n" ]
# set_property PACKAGE_PIN V6) [ get_ports "gt_clk156p25_n" ]
# set_property PACKAGE_PIN V7 [ get_ports "gt_clk156p25_p" ]

# designs/ddr4_0_ex/imports/example_design.xdc
#set_property PACKAGE_PIN Y15 [get_ports sd_clk]

# From schematics
#set_property PACKAGE_PIN AB6 [ get_ports "pcie_clk_n" ]
#set_property PACKAGE_PIN AB7 [ get_ports "pcie_clk_p" ]
#set_property PACKAGE_PIN Y11 [ get_ports "qspi0_sclk" ]


# LED[1-4]
set_property PACKAGE_PIN H9 [ get_ports {led[0]} ]
set_property IOSTANDARD LVCMOS33 [ get_ports {led[0]} ]
set_property DRIVE 8 [ get_ports {led[0]} ]

set_property PACKAGE_PIN J9 [ get_ports {led[1]} ]
set_property IOSTANDARD LVCMOS33 [ get_ports {led[1]} ]
set_property DRIVE 8 [ get_ports {led[1]} ]

set_property PACKAGE_PIN G11 [ get_ports "led[2]" ]
set_property IOSTANDARD LVCMOS33 [ get_ports "led[2]" ]
set_property DRIVE 8 [ get_ports "led[2]" ]

set_property PACKAGE_PIN H11 [ get_ports {led[3]} ]
set_property IOSTANDARD LVCMOS33 [ get_ports {led[3]} ]
set_property DRIVE 8 [ get_ports {led[3]} ]

# KEY[1-4] (really, four push buttons)
set_property IOSTANDARD LVCMOS33 [get_ports "key[0]"]
set_property PACKAGE_PIN K9 [get_ports "key[0]"]
set_property IOSTANDARD LVCMOS33 [get_ports "key[1]"]
set_property PACKAGE_PIN K10 [get_ports "key[1]"]
set_property IOSTANDARD LVCMOS33 [get_ports "key[2]"]
set_property PACKAGE_PIN J10 [get_ports "key[2]"]
set_property IOSTANDARD LVCMOS33 [get_ports "key[3]"]
set_property PACKAGE_PIN J11 [get_ports "key[3]"]

# FPGA_UART_{RX,TX}
set_property IOSTANDARD LVCMOS33 [get_ports rxd]
set_property PACKAGE_PIN AD13 [get_ports rxd]
set_property IOSTANDARD LVCMOS33 [get_ports txd]
set_property PACKAGE_PIN AC14 [get_ports txd]
