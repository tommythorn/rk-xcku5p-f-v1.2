## please copy over all contents of the XDC when it is merged with othe XDC files ##

## Clock constraint for input system clock which drives MMCM for the design

## The frequency of the input clock is as per GUI selected input clock period

create_clock -period 5.0 [get_ports c0_sys_clk_p]


## Below pin LOC constraints are for system clock and system reset and

## memory related pins

set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[13]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[15]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[8]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[10]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_ck_t[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[26]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[27]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_t[1]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[9]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[11]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[6]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_ck_c[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[6]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[1]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_c[1]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[15]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[11]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[7]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[4]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[5]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[7]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_t[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_bg[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[16]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[12]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[9]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[2]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[4]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[5]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_c[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_cs_n[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_ba[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_cke[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[10]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[3]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dm_dbi_n[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_odt[0]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_ba[1]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[13]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[14]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[8]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_adr[1]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[2]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[3]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[18]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[20]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[21]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dm_dbi_n[2]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[19]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[16]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[17]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_t[2]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_c[2]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[28]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[30]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[22]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[23]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[29]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[31]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_t[3]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dqs_c[3]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[12]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[14]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dm_dbi_n[1]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_act_n" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dm_dbi_n[3]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[24]" ]
set_property OUTPUT_IMPEDANCE RDRV_40_40 [ get_ports "c0_ddr4_dq[25]" ]




set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[13]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[15]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[8]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[10]" ]
set_property IOSTANDARD DIFF_SSTL12_DCI [ get_ports "c0_ddr4_ck_t[0]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[26]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[27]" ]
set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_t[1]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[9]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[11]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[6]" ]
set_property IOSTANDARD DIFF_SSTL12_DCI [ get_ports "c0_ddr4_ck_c[0]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[6]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[0]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[1]" ]
set_property IOSTANDARD LVCMOS12 [ get_ports "c0_ddr4_reset_n" ]
set_property DRIVE 8 [ get_ports "c0_ddr4_reset_n" ]

set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_c[1]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[15]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[11]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[7]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[4]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[5]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[7]" ]
set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_t[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_bg[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[16]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[12]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[9]" ]
set_property IOSTANDARD DIFF_SSTL12 [ get_ports "c0_sys_clk_p" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[2]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[4]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[5]" ]
set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_c[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_cs_n[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_ba[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_cke[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[10]" ]
set_property IOSTANDARD DIFF_SSTL12 [ get_ports "c0_sys_clk_n" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[3]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dm_dbi_n[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_odt[0]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_ba[1]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[13]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[14]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[8]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_adr[1]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[2]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[3]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[18]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[20]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[21]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dm_dbi_n[2]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[19]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[16]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[17]" ]
set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_t[2]" ]
set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_c[2]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[28]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[30]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[22]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[23]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[29]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[31]" ]
set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_t[3]" ]
set_property IOSTANDARD DIFF_POD12_DCI [ get_ports "c0_ddr4_dqs_c[3]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[12]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[14]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dm_dbi_n[1]" ]
set_property IOSTANDARD SSTL12_DCI [ get_ports "c0_ddr4_act_n" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dm_dbi_n[3]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[24]" ]
set_property IOSTANDARD POD12_DCI [ get_ports "c0_ddr4_dq[25]" ]


## These signals once asserted, stays asserted for multiple clock cycles.

## False path constraint is added to improve the HOLD timing.

set_false_path -hold -to [get_pins */*/*/*/*/*.u_xiphy_control/xiphy_control/RIU_ADDR*]
set_false_path -hold -to [get_pins */*/*/*/*/*.u_xiphy_control/xiphy_control/RIU_WR_DATA*]


set_property SLEW FAST  [get_ports {c0_ddr4_adr[*] c0_ddr4_act_n c0_ddr4_ba[*] c0_ddr4_bg[*] c0_ddr4_cke[*] c0_ddr4_ck_t[*] c0_ddr4_ck_c[*] c0_ddr4_odt[*] c0_ddr4_dq[*] c0_ddr4_dqs_t[*] c0_ddr4_dqs_c[*]}]
set_property IBUF_LOW_PWR FALSE  [get_ports {c0_ddr4_dq[*] c0_ddr4_dqs_t[*] c0_ddr4_dqs_c[*]}]
set_property ODT RTT_40  [get_ports {c0_ddr4_dq[*] c0_ddr4_dqs_t[*] c0_ddr4_dqs_c[*]}]
set_property EQUALIZATION EQ_LEVEL2 [get_ports {c0_ddr4_dq[*] c0_ddr4_dqs_t[*] c0_ddr4_dqs_c[*]}]
set_property PRE_EMPHASIS RDRV_240 [get_ports {c0_ddr4_dq[*] c0_ddr4_dqs_t[*] c0_ddr4_dqs_c[*]}]
set_property SLEW FAST  [get_ports {c0_ddr4_cs_n[*]}]
set_property DATA_RATE SDR  [get_ports {c0_ddr4_cs_n[*]}]
set_property SLEW FAST  [get_ports {c0_ddr4_dm_dbi_n[*]}]
set_property IBUF_LOW_PWR FALSE  [get_ports {c0_ddr4_dm_dbi_n[*]}]
set_property ODT RTT_40  [get_ports {c0_ddr4_dm_dbi_n[*]}]
set_property EQUALIZATION EQ_LEVEL2 [get_ports {c0_ddr4_dm_dbi_n[*]}]
set_property PRE_EMPHASIS RDRV_240 [get_ports {c0_ddr4_dm_dbi_n[*]}]
set_property DATA_RATE DDR [get_ports {c0_ddr4_dm_dbi_n[*]}]
set_property DATA_RATE SDR  [get_ports {c0_ddr4_adr[*] c0_ddr4_act_n c0_ddr4_ba[*] c0_ddr4_bg[*] c0_ddr4_cke[*] c0_ddr4_odt[*] }]
set_property DATA_RATE DDR  [get_ports {c0_ddr4_dq[*] c0_ddr4_dqs_t[*] c0_ddr4_dqs_c[*] c0_ddr4_ck_t[*] c0_ddr4_ck_c[*]}]
## Multi-cycle path constraints for Fabric - RIU clock domain crossing signals
set_max_delay 5.0 -datapath_only -from [get_pins */*/*/u_ddr_cal_addr_decode/io_ready_lvl_reg/C] -to [get_pins */u_io_ready_lvl_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 5.0 -datapath_only -from [get_pins */*/*/u_ddr_cal_addr_decode/io_read_data_reg[*]/C] -to [get_pins */u_io_read_data_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins */*/*/phy_ready_riuclk_reg/C] -to [get_pins */u_phy2clb_phy_ready_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins */*/*/bisc_complete_riuclk_reg/C] -to [get_pins */u_phy2clb_bisc_complete_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_addr_strobe_lvl_riuclk_reg/C] -to [get_pins */u_io_addr_strobe_lvl_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_write_strobe_riuclk_reg/C] -to [get_pins */u_io_write_strobe_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_address_riuclk_reg[*]/C] -to [get_pins */u_io_addr_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_write_data_riuclk_reg[*]/C] -to [get_pins */u_io_write_data_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 10.0 -datapath_only -from [get_pins */en_vtc_in_reg/C] -to [get_pins */u_en_vtc_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 10.0 -datapath_only -from [get_pins */*/riu2clb_valid_r1_riuclk_reg[*]/C] -to [get_pins */u_riu2clb_valid_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_fixdly_rdy_low_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_fixdly_rdy_low/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_fixdly_rdy_upp_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_fixdly_rdy_upp/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_phy_rdy_low_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_phy_rdy_low/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_phy_rdy_upp_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_phy_rdy_upp/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 10.0 -datapath_only -from [get_pins */rst_r1_reg/C] -to [get_pins */u_fab_rst_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/clb2phy_t_b_addr_riuclk_reg/C] -to [get_pins  */*/*/clb2phy_t_b_addr_i_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_en_lvl_reg/C] -to [get_pins  */*/*/*/u_slave_en_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_we_r_reg/C] -to [get_pins  */*/*/*/u_slave_we_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_addr_r_reg[*]/C] -to [get_pins  */*/*/*/u_slave_addr_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_di_r_reg[*]/C] -to [get_pins  */*/*/*/u_slave_di_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_rdy_cptd_sclk_reg/C] -to [get_pins  */*/*/*/u_slave_rdy_cptd_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 12.0 -datapath_only -from [get_pins */*/*/*/slave_rdy_lvl_fclk_reg/C] -to [get_pins  */*/*/*/u_slave_rdy_sync/SYNC[*].sync_reg_reg[0]/D]
set_max_delay 12.0 -datapath_only -from [get_pins */*/*/*/slave_do_fclk_reg[*]/C] -to [get_pins  */*/*/*/u_slave_do_sync/SYNC[*].sync_reg_reg[0]/D]
set_false_path -through [get_pins u_ddr4_infrastructure/sys_rst]
set_false_path -from [get_pins  */input_rst_design_reg/C] -to [get_pins */rst_div_sync_r_reg[0]/D]
set_false_path -from [get_pins  */input_rst_design_reg/C] -to [get_pins */rst_riu_sync_r_reg[0]/D]
set_false_path -from [get_pins  */input_rst_design_reg/C] -to [get_pins */rst_mb_sync_r_reg[0]/D]
set_false_path -from [get_pins  */rst_async_riu_div_reg/C] -to [get_pins */rst_div_sync_r_reg[0]/D]
set_false_path -from [get_pins  */rst_async_mb_reg/C]      -to [get_pins */rst_mb_sync_r_reg[0]/D]
set_false_path -from [get_pins  */rst_async_riu_div_reg/C] -to [get_pins */rst_riu_sync_r_reg[0]/D]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-55 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*gen_mmcme*.u_mmcme_adv_inst*" -filter {NAME =~ *inst/u_ddr4_infrastructure*}]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-56 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*gen_mmcme*.u_mmcme_adv_inst*" -filter {NAME =~ *inst/u_ddr4_infrastructure*}]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-57 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*plle_loop[*].gen_plle*.PLLE*_BASE_INST_OTHER*" -filter {NAME =~ *inst/u_ddr4_phy_pll*}]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-58 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*plle_loop[*].gen_plle*.PLLE*_BASE_INST_OTHER*" -filter {NAME =~ *inst/u_ddr4_phy_pll*}]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-40 -description "MMCM is driven through a BUFGCE" -objects [get_cells -hierarchical "*gen_mmcme*.u_mmcme_adv_inst*" -filter {NAME =~ *inst/u_ddr4_infrastructure*}]
## These below commands are used to create Interface ports for controller.

create_interface -quiet interface_ddr4_0
set_property interface interface_ddr4_0 [get_ports [list {c0_ddr4_dq[13]} {c0_ddr4_dq[15]} {c0_ddr4_dq[8]} {c0_ddr4_dq[10]} {c0_ddr4_ck_t[0]} {c0_ddr4_dq[26]} {c0_ddr4_dq[27]} {c0_ddr4_dqs_t[1]} {c0_ddr4_dq[9]} {c0_ddr4_dq[11]} {c0_ddr4_adr[6]} {c0_ddr4_ck_c[0]} {c0_ddr4_dq[6]} {c0_ddr4_dq[0]} {c0_ddr4_dq[1]} c0_ddr4_reset_n {c0_ddr4_dqs_c[1]} {c0_ddr4_adr[15]} {c0_ddr4_adr[11]} {c0_ddr4_adr[7]} {c0_ddr4_adr[4]} {c0_ddr4_adr[5]} {c0_ddr4_dq[7]} {c0_ddr4_dqs_t[0]} {c0_ddr4_bg[0]} {c0_ddr4_adr[16]} {c0_ddr4_adr[12]} {c0_ddr4_adr[9]} c0_sys_clk_p {c0_ddr4_adr[2]} {c0_ddr4_dq[4]} {c0_ddr4_dq[5]} {c0_ddr4_dqs_c[0]} {c0_ddr4_cs_n[0]} {c0_ddr4_ba[0]} {c0_ddr4_cke[0]} {c0_ddr4_adr[10]} c0_sys_clk_n {c0_ddr4_adr[0]} {c0_ddr4_adr[3]} {c0_ddr4_dm_dbi_n[0]} {c0_ddr4_odt[0]} {c0_ddr4_ba[1]} {c0_ddr4_adr[13]} {c0_ddr4_adr[14]} {c0_ddr4_adr[8]} {c0_ddr4_adr[1]} {c0_ddr4_dq[2]} {c0_ddr4_dq[3]} {c0_ddr4_dq[18]} {c0_ddr4_dq[20]} {c0_ddr4_dq[21]} {c0_ddr4_dm_dbi_n[2]} {c0_ddr4_dq[19]} {c0_ddr4_dq[16]} {c0_ddr4_dq[17]} {c0_ddr4_dqs_t[2]} {c0_ddr4_dqs_c[2]} {c0_ddr4_dq[28]} {c0_ddr4_dq[30]} {c0_ddr4_dq[22]} {c0_ddr4_dq[23]} {c0_ddr4_dq[29]} {c0_ddr4_dq[31]} {c0_ddr4_dqs_t[3]} {c0_ddr4_dqs_c[3]} {c0_ddr4_dq[12]} {c0_ddr4_dq[14]} {c0_ddr4_dm_dbi_n[1]} c0_ddr4_act_n {c0_ddr4_dm_dbi_n[3]} {c0_ddr4_dq[24]} {c0_ddr4_dq[25]}]]
