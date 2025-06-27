onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xilinx_vip -L xpm -L gtwizard_ultrascale_v1_7_16 -L xil_defaultlib -L blk_mem_gen_v8_4_6 -L xdma_v4_1_23 -L microblaze_v11_0_11 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L lmb_v10_v3_0_12 -L lmb_bram_if_cntlr_v4_0_22 -L iomodule_v3_1_8 -L util_vector_logic_v2_0_2 -L xlconstant_v1_1_7 -L smartconnect_v1_0 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_28 -L axi_vip_v1_1_14 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.design_1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {design_1.udo}

run 1000ns

quit -force
