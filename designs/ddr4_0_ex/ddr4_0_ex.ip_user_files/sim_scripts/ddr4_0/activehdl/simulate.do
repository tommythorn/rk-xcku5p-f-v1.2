transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+ddr4_0  -L xpm -L microblaze_v11_0_11 -L xil_defaultlib -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L lmb_v10_v3_0_12 -L lmb_bram_if_cntlr_v4_0_22 -L blk_mem_gen_v8_4_6 -L iomodule_v3_1_8 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ddr4_0 xil_defaultlib.glbl

do {ddr4_0.udo}

run 1000ns

endsim

quit -force
