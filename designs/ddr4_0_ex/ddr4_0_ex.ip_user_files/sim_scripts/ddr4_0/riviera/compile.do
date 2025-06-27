transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {D:/VIVADO23/ku5p/ddr4_0_ex/ddr4_0_ex.cache/compile_simlib/riviera}
vlib riviera/xpm
vlib riviera/microblaze_v11_0_11
vlib riviera/xil_defaultlib
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/lmb_v10_v3_0_12
vlib riviera/lmb_bram_if_cntlr_v4_0_22
vlib riviera/blk_mem_gen_v8_4_6
vlib riviera/iomodule_v3_1_8

vlog -work xpm  -incr "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal" -l xpm -l microblaze_v11_0_11 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_13 -l lmb_v10_v3_0_12 -l lmb_bram_if_cntlr_v4_0_22 -l blk_mem_gen_v8_4_6 -l iomodule_v3_1_8 \
"C:/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_11 -93  -incr \
"../../../ipstatic/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_0/sim/bd_9054_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -93  -incr \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  -incr \
"../../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_1/sim/bd_9054_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_12 -93  -incr \
"../../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_2/sim/bd_9054_ilmb_0.vhd" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_3/sim/bd_9054_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_22 -93  -incr \
"../../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_4/sim/bd_9054_dlmb_cntlr_0.vhd" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_5/sim/bd_9054_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_6  -incr -v2k5 "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal" -l xpm -l microblaze_v11_0_11 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_13 -l lmb_v10_v3_0_12 -l lmb_bram_if_cntlr_v4_0_22 -l blk_mem_gen_v8_4_6 -l iomodule_v3_1_8 \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal" -l xpm -l microblaze_v11_0_11 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_13 -l lmb_v10_v3_0_12 -l lmb_bram_if_cntlr_v4_0_22 -l blk_mem_gen_v8_4_6 -l iomodule_v3_1_8 \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_6/sim/bd_9054_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_7/sim/bd_9054_second_dlmb_cntlr_0.vhd" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_8/sim/bd_9054_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal" -l xpm -l microblaze_v11_0_11 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_13 -l lmb_v10_v3_0_12 -l lmb_bram_if_cntlr_v4_0_22 -l blk_mem_gen_v8_4_6 -l iomodule_v3_1_8 \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_9/sim/bd_9054_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_8 -93  -incr \
"../../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/ip/ip_10/sim/bd_9054_iomodule_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal" -l xpm -l microblaze_v11_0_11 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_13 -l lmb_v10_v3_0_12 -l lmb_bram_if_cntlr_v4_0_22 -l blk_mem_gen_v8_4_6 -l iomodule_v3_1_8 \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/bd_0/sim/bd_9054.v" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_0/sim/ddr4_0_microblaze_mcs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/map" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top" "+incdir+../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal" -l xpm -l microblaze_v11_0_11 -l xil_defaultlib -l lib_cdc_v1_0_2 -l proc_sys_reset_v5_0_13 -l lmb_v10_v3_0_12 -l lmb_bram_if_cntlr_v4_0_22 -l blk_mem_gen_v8_4_6 -l iomodule_v3_1_8 \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_0_phy_ddr4.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/ip_1/rtl/ip_top/ddr4_0_phy.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0_ddr4_mem_intfc.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/cal/ddr4_0_ddr4_cal_riu.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/rtl/ip_top/ddr4_0.sv" \
"../../../../ddr4_0_ex.gen/sources_1/ip/ddr4_0/tb/ddr4_0_microblaze_mcs_0.sv" \

vlog -work xil_defaultlib \
"glbl.v"

