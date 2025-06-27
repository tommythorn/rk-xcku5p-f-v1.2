// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Jun 26 14:33:37 2024
// Host        : DESKTOP-ND6K090 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/ZEYI/FPGA/K7/K325T/v231/6_top_sd_rw/prj/top_sd_rw.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out1, clk_out2, reset, locked, clk_in1_p, 
  clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="reset,locked,clk_in1_p,clk_in1_n" */
/* synthesis syn_force_seq_prim="clk_out1" */
/* synthesis syn_force_seq_prim="clk_out2" */;
  output clk_out1 /* synthesis syn_isclock = 1 */;
  output clk_out2 /* synthesis syn_isclock = 1 */;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
