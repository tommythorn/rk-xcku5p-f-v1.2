set_property SRC_FILE_INFO {cfile:d:/VIVADO231/ku5p/pcie_test/pcie_test.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_1/bd_0/ip/ip_0/bd_382b_microblaze_I_0.xdc rfile:../../../pcie_test.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_1/bd_0/ip/ip_0/bd_382b_microblaze_I_0.xdc id:1 order:EARLY scoped_inst:inst/u_ddr4_mem_intfc/u_ddr_cal_riu/mcs0/inst/microblaze_I/U0} [current_design]
set_property SRC_FILE_INFO {cfile:d:/VIVADO231/ku5p/pcie_test/pcie_test.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_1/par/design_1_ddr4_0_1.xdc rfile:../../../pcie_test.gen/sources_1/bd/design_1/ip/design_1_ddr4_0_1/par/design_1_ddr4_0_1.xdc id:2 order:EARLY scoped_inst:inst} [current_design]
current_instance inst/u_ddr4_mem_intfc/u_ddr_cal_riu/mcs0/inst/microblaze_I/U0
set_property src_info {type:SCOPED_XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" -to [get_pins -quiet "LOCKSTEP_Out_reg\[*\]/R"]
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" -to [get_pins -quiet "MicroBlaze_Core_I/*Interrupt_DFF/Single_Synchronize.use_sync_reset.sync_reg/D"]
set_property src_info {type:SCOPED_XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPIP-1 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~A[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPIP-1 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~B[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPIP-2 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~A[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:17 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPIP-2 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~B[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-1 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~P*} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-2 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~P*} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-3 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~P*} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-3 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~PATTERN*} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-3 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~*OUT*} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-4 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~P[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-4 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~PATTERN*} -of [get_cells -hierarchical *DSP48E1_I1]]
set_property src_info {type:SCOPED_XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze -tags 12436 -type DRC -id DPOP-4 -description "Non-pipelined by design" -objects [get_cells -hierarchical *DSP48E1_I1] -objects [get_pins -quiet -filter {REF_PIN_NAME=~*OUT*} -of [get_cells -hierarchical *DSP48E1_I1]]
current_instance
current_instance inst
set_property src_info {type:SCOPED_XDC file:2 line:169 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -hold -to [get_pins */*/*/*/*/*.u_xiphy_control/xiphy_control/RIU_ADDR*]
set_property src_info {type:SCOPED_XDC file:2 line:170 export:INPUT save:INPUT read:READ} [current_design]
set_false_path -hold -to [get_pins */*/*/*/*/*.u_xiphy_control/xiphy_control/RIU_WR_DATA*]
set_property src_info {type:SCOPED_XDC file:2 line:189 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 5.0 -datapath_only -from [get_pins */*/*/u_ddr_cal_addr_decode/io_ready_lvl_reg/C] -to [get_pins */u_io_ready_lvl_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:190 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 5.0 -datapath_only -from [get_pins */*/*/u_ddr_cal_addr_decode/io_read_data_reg[*]/C] -to [get_pins */u_io_read_data_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:191 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins */*/*/phy_ready_riuclk_reg/C] -to [get_pins */u_phy2clb_phy_ready_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:192 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins */*/*/bisc_complete_riuclk_reg/C] -to [get_pins */u_phy2clb_bisc_complete_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:193 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_addr_strobe_lvl_riuclk_reg/C] -to [get_pins */u_io_addr_strobe_lvl_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:194 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_write_strobe_riuclk_reg/C] -to [get_pins */u_io_write_strobe_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:195 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_address_riuclk_reg[*]/C] -to [get_pins */u_io_addr_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:196 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins */*/io_write_data_riuclk_reg[*]/C] -to [get_pins */u_io_write_data_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:197 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 10.0 -datapath_only -from [get_pins */en_vtc_in_reg/C] -to [get_pins */u_en_vtc_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:198 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 10.0 -datapath_only -from [get_pins */*/riu2clb_valid_r1_riuclk_reg[*]/C] -to [get_pins */u_riu2clb_valid_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:199 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_fixdly_rdy_low_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_fixdly_rdy_low/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:200 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_fixdly_rdy_upp_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_fixdly_rdy_upp/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:201 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_phy_rdy_low_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_phy_rdy_low/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:202 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 10.0 -datapath_only -from [get_pins */*/*/phy2clb_phy_rdy_upp_riuclk_int_reg[*]/C] -to [get_pins */u_phy2clb_phy_rdy_upp/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:203 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 10.0 -datapath_only -from [get_pins */rst_r1_reg/C] -to [get_pins */u_fab_rst_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:204 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/clb2phy_t_b_addr_riuclk_reg/C] -to [get_pins  */*/*/clb2phy_t_b_addr_i_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:205 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_en_lvl_reg/C] -to [get_pins  */*/*/*/u_slave_en_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:206 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_we_r_reg/C] -to [get_pins  */*/*/*/u_slave_we_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:207 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_addr_r_reg[*]/C] -to [get_pins  */*/*/*/u_slave_addr_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:208 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_di_r_reg[*]/C] -to [get_pins  */*/*/*/u_slave_di_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:209 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 3.0 -datapath_only -from [get_pins  */*/*/*/slave_rdy_cptd_sclk_reg/C] -to [get_pins  */*/*/*/u_slave_rdy_cptd_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:210 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 12.0 -datapath_only -from [get_pins */*/*/*/slave_rdy_lvl_fclk_reg/C] -to [get_pins  */*/*/*/u_slave_rdy_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:211 export:INPUT save:INPUT read:READ} [current_design]
set_max_delay 12.0 -datapath_only -from [get_pins */*/*/*/slave_do_fclk_reg[*]/C] -to [get_pins  */*/*/*/u_slave_do_sync/SYNC[*].sync_reg_reg[0]/D]
set_property src_info {type:SCOPED_XDC file:2 line:219 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-55 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*gen_mmcme*.u_mmcme_adv_inst*" -filter {NAME =~ *inst/u_ddr4_infrastructure*}]
set_property src_info {type:SCOPED_XDC file:2 line:220 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-56 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*gen_mmcme*.u_mmcme_adv_inst*" -filter {NAME =~ *inst/u_ddr4_infrastructure*}]
set_property src_info {type:SCOPED_XDC file:2 line:221 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-57 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*plle_loop[*].gen_plle*.PLLE*_BASE_INST_OTHER*" -filter {NAME =~ *inst/u_ddr4_phy_pll*}]
set_property src_info {type:SCOPED_XDC file:2 line:222 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-58 -description "Clocking Primitives will be Auto-Placed" -objects [get_cells -hierarchical "*plle_loop[*].gen_plle*.PLLE*_BASE_INST_OTHER*" -filter {NAME =~ *inst/u_ddr4_phy_pll*}]
set_property src_info {type:SCOPED_XDC file:2 line:223 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -user DDR4 -tags "1010162" -scope -type METHODOLOGY -id CLKC-40 -description "MMCM is driven through a BUFGCE" -objects [get_cells -hierarchical "*gen_mmcme*.u_mmcme_adv_inst*" -filter {NAME =~ *inst/u_ddr4_infrastructure*}]
