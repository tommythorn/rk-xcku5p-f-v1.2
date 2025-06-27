//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Fri Apr  4 17:46:21 2025
//Host        : DESKTOP-IDDMGFU running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR4_DIFF_CLK_clk_n,
    DDR4_DIFF_CLK_clk_p,
    c0_init_calib_complete_0,
    ddr4_mig_resetn,
    ddr4_rtl_0_act_n,
    ddr4_rtl_0_adr,
    ddr4_rtl_0_ba,
    ddr4_rtl_0_bg,
    ddr4_rtl_0_ck_c,
    ddr4_rtl_0_ck_t,
    ddr4_rtl_0_cke,
    ddr4_rtl_0_cs_n,
    ddr4_rtl_0_dm_n,
    ddr4_rtl_0_dq,
    ddr4_rtl_0_dqs_c,
    ddr4_rtl_0_dqs_t,
    ddr4_rtl_0_odt,
    ddr4_rtl_0_reset_n,
    diff_clock_rtl_0_clk_n,
    diff_clock_rtl_0_clk_p,
    pcie_7x_mgt_rtl_0_rxn,
    pcie_7x_mgt_rtl_0_rxp,
    pcie_7x_mgt_rtl_0_txn,
    pcie_7x_mgt_rtl_0_txp,
    reset_rtl_0,
    user_lnk_up_0);
  input DDR4_DIFF_CLK_clk_n;
  input DDR4_DIFF_CLK_clk_p;
  output c0_init_calib_complete_0;
  input ddr4_mig_resetn;
  output ddr4_rtl_0_act_n;
  output [16:0]ddr4_rtl_0_adr;
  output [1:0]ddr4_rtl_0_ba;
  output [0:0]ddr4_rtl_0_bg;
  output [0:0]ddr4_rtl_0_ck_c;
  output [0:0]ddr4_rtl_0_ck_t;
  output [0:0]ddr4_rtl_0_cke;
  output [0:0]ddr4_rtl_0_cs_n;
  inout [3:0]ddr4_rtl_0_dm_n;
  inout [31:0]ddr4_rtl_0_dq;
  inout [3:0]ddr4_rtl_0_dqs_c;
  inout [3:0]ddr4_rtl_0_dqs_t;
  output [0:0]ddr4_rtl_0_odt;
  output ddr4_rtl_0_reset_n;
  input [0:0]diff_clock_rtl_0_clk_n;
  input [0:0]diff_clock_rtl_0_clk_p;
  input [3:0]pcie_7x_mgt_rtl_0_rxn;
  input [3:0]pcie_7x_mgt_rtl_0_rxp;
  output [3:0]pcie_7x_mgt_rtl_0_txn;
  output [3:0]pcie_7x_mgt_rtl_0_txp;
  input reset_rtl_0;
  output user_lnk_up_0;

  wire DDR4_DIFF_CLK_clk_n;
  wire DDR4_DIFF_CLK_clk_p;
  wire c0_init_calib_complete_0;
  wire ddr4_mig_resetn;
  wire ddr4_rtl_0_act_n;
  wire [16:0]ddr4_rtl_0_adr;
  wire [1:0]ddr4_rtl_0_ba;
  wire [0:0]ddr4_rtl_0_bg;
  wire [0:0]ddr4_rtl_0_ck_c;
  wire [0:0]ddr4_rtl_0_ck_t;
  wire [0:0]ddr4_rtl_0_cke;
  wire [0:0]ddr4_rtl_0_cs_n;
  wire [3:0]ddr4_rtl_0_dm_n;
  wire [31:0]ddr4_rtl_0_dq;
  wire [3:0]ddr4_rtl_0_dqs_c;
  wire [3:0]ddr4_rtl_0_dqs_t;
  wire [0:0]ddr4_rtl_0_odt;
  wire ddr4_rtl_0_reset_n;
  wire [0:0]diff_clock_rtl_0_clk_n;
  wire [0:0]diff_clock_rtl_0_clk_p;
  wire [3:0]pcie_7x_mgt_rtl_0_rxn;
  wire [3:0]pcie_7x_mgt_rtl_0_rxp;
  wire [3:0]pcie_7x_mgt_rtl_0_txn;
  wire [3:0]pcie_7x_mgt_rtl_0_txp;
  wire reset_rtl_0;
  wire user_lnk_up_0;

  design_1 design_1_i
       (.DDR4_DIFF_CLK_clk_n(DDR4_DIFF_CLK_clk_n),
        .DDR4_DIFF_CLK_clk_p(DDR4_DIFF_CLK_clk_p),
        .c0_init_calib_complete_0(c0_init_calib_complete_0),
        .ddr4_mig_resetn(ddr4_mig_resetn),
        .ddr4_rtl_0_act_n(ddr4_rtl_0_act_n),
        .ddr4_rtl_0_adr(ddr4_rtl_0_adr),
        .ddr4_rtl_0_ba(ddr4_rtl_0_ba),
        .ddr4_rtl_0_bg(ddr4_rtl_0_bg),
        .ddr4_rtl_0_ck_c(ddr4_rtl_0_ck_c),
        .ddr4_rtl_0_ck_t(ddr4_rtl_0_ck_t),
        .ddr4_rtl_0_cke(ddr4_rtl_0_cke),
        .ddr4_rtl_0_cs_n(ddr4_rtl_0_cs_n),
        .ddr4_rtl_0_dm_n(ddr4_rtl_0_dm_n),
        .ddr4_rtl_0_dq(ddr4_rtl_0_dq),
        .ddr4_rtl_0_dqs_c(ddr4_rtl_0_dqs_c),
        .ddr4_rtl_0_dqs_t(ddr4_rtl_0_dqs_t),
        .ddr4_rtl_0_odt(ddr4_rtl_0_odt),
        .ddr4_rtl_0_reset_n(ddr4_rtl_0_reset_n),
        .diff_clock_rtl_0_clk_n(diff_clock_rtl_0_clk_n),
        .diff_clock_rtl_0_clk_p(diff_clock_rtl_0_clk_p),
        .pcie_7x_mgt_rtl_0_rxn(pcie_7x_mgt_rtl_0_rxn),
        .pcie_7x_mgt_rtl_0_rxp(pcie_7x_mgt_rtl_0_rxp),
        .pcie_7x_mgt_rtl_0_txn(pcie_7x_mgt_rtl_0_txn),
        .pcie_7x_mgt_rtl_0_txp(pcie_7x_mgt_rtl_0_txp),
        .reset_rtl_0(reset_rtl_0),
        .user_lnk_up_0(user_lnk_up_0));
endmodule
