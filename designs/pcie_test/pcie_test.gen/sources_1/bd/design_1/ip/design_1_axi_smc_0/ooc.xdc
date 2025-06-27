# aclk {FREQ_HZ 333250000 CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk PHASE 0.00} aclk1 {FREQ_HZ 250000000 CLK_DOMAIN design_1_xdma_0_0_axi_aclk PHASE 0.0}
# Clock Domain: design_1_ddr4_0_1_c0_ddr4_ui_clk
create_clock -name aclk -period 3.001 [get_ports aclk]
# Clock Domain: design_1_xdma_0_0_axi_aclk
create_clock -name aclk1 -period 4.000 [get_ports aclk1]
# Generated clocks
