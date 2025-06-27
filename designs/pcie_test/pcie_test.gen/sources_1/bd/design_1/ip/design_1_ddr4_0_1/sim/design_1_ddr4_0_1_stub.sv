// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


//------------------------------------------------------------------------------------
// Filename:    design_1_ddr4_0_1_stub.sv
// Description: This HDL file is intended to be used with following simulators only:
//
//   Vivado Simulator (XSim)
//   Cadence Xcelium Simulator
//
//------------------------------------------------------------------------------------
`timescale 1ps/1ps

`ifdef XILINX_SIMULATOR

`ifndef XILINX_SIMULATOR_BITASBOOL
`define XILINX_SIMULATOR_BITASBOOL
typedef bit bit_as_bool;
`endif

(* SC_MODULE_EXPORT *)
module design_1_ddr4_0_1 (
  output bit_as_bool c0_init_calib_complete,
  output bit_as_bool dbg_clk,
  input bit_as_bool c0_sys_clk_p,
  input bit_as_bool c0_sys_clk_n,
  output bit [511 : 0] dbg_bus,
  output bit [16 : 0] c0_ddr4_adr,
  output bit [1 : 0] c0_ddr4_ba,
  output bit [0 : 0] c0_ddr4_cke,
  output bit [0 : 0] c0_ddr4_cs_n,
  output bit [3 : 0] c0_ddr4_dm_dbi_n,
  output bit [31 : 0] c0_ddr4_dq,
  output bit [3 : 0] c0_ddr4_dqs_c,
  output bit [3 : 0] c0_ddr4_dqs_t,
  output bit [0 : 0] c0_ddr4_odt,
  output bit [0 : 0] c0_ddr4_bg,
  output bit_as_bool c0_ddr4_reset_n,
  output bit_as_bool c0_ddr4_act_n,
  output bit [0 : 0] c0_ddr4_ck_c,
  output bit [0 : 0] c0_ddr4_ck_t,
  output bit_as_bool c0_ddr4_ui_clk,
  output bit_as_bool c0_ddr4_ui_clk_sync_rst,
  input bit_as_bool c0_ddr4_aresetn,
  input bit [0 : 0] c0_ddr4_s_axi_awid,
  input bit [30 : 0] c0_ddr4_s_axi_awaddr,
  input bit [7 : 0] c0_ddr4_s_axi_awlen,
  input bit [2 : 0] c0_ddr4_s_axi_awsize,
  input bit [1 : 0] c0_ddr4_s_axi_awburst,
  input bit [0 : 0] c0_ddr4_s_axi_awlock,
  input bit [3 : 0] c0_ddr4_s_axi_awcache,
  input bit [2 : 0] c0_ddr4_s_axi_awprot,
  input bit [3 : 0] c0_ddr4_s_axi_awqos,
  input bit_as_bool c0_ddr4_s_axi_awvalid,
  output bit_as_bool c0_ddr4_s_axi_awready,
  input bit [255 : 0] c0_ddr4_s_axi_wdata,
  input bit [31 : 0] c0_ddr4_s_axi_wstrb,
  input bit_as_bool c0_ddr4_s_axi_wlast,
  input bit_as_bool c0_ddr4_s_axi_wvalid,
  output bit_as_bool c0_ddr4_s_axi_wready,
  input bit_as_bool c0_ddr4_s_axi_bready,
  output bit [0 : 0] c0_ddr4_s_axi_bid,
  output bit [1 : 0] c0_ddr4_s_axi_bresp,
  output bit_as_bool c0_ddr4_s_axi_bvalid,
  input bit [0 : 0] c0_ddr4_s_axi_arid,
  input bit [30 : 0] c0_ddr4_s_axi_araddr,
  input bit [7 : 0] c0_ddr4_s_axi_arlen,
  input bit [2 : 0] c0_ddr4_s_axi_arsize,
  input bit [1 : 0] c0_ddr4_s_axi_arburst,
  input bit [0 : 0] c0_ddr4_s_axi_arlock,
  input bit [3 : 0] c0_ddr4_s_axi_arcache,
  input bit [2 : 0] c0_ddr4_s_axi_arprot,
  input bit [3 : 0] c0_ddr4_s_axi_arqos,
  input bit_as_bool c0_ddr4_s_axi_arvalid,
  output bit_as_bool c0_ddr4_s_axi_arready,
  input bit_as_bool c0_ddr4_s_axi_rready,
  output bit_as_bool c0_ddr4_s_axi_rlast,
  output bit_as_bool c0_ddr4_s_axi_rvalid,
  output bit [1 : 0] c0_ddr4_s_axi_rresp,
  output bit [0 : 0] c0_ddr4_s_axi_rid,
  output bit [255 : 0] c0_ddr4_s_axi_rdata,
  input bit_as_bool sys_rst
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module design_1_ddr4_0_1 (c0_init_calib_complete,dbg_clk,c0_sys_clk_p,c0_sys_clk_n,dbg_bus,c0_ddr4_adr,c0_ddr4_ba,c0_ddr4_cke,c0_ddr4_cs_n,c0_ddr4_dm_dbi_n,c0_ddr4_dq,c0_ddr4_dqs_c,c0_ddr4_dqs_t,c0_ddr4_odt,c0_ddr4_bg,c0_ddr4_reset_n,c0_ddr4_act_n,c0_ddr4_ck_c,c0_ddr4_ck_t,c0_ddr4_ui_clk,c0_ddr4_ui_clk_sync_rst,c0_ddr4_aresetn,c0_ddr4_s_axi_awid,c0_ddr4_s_axi_awaddr,c0_ddr4_s_axi_awlen,c0_ddr4_s_axi_awsize,c0_ddr4_s_axi_awburst,c0_ddr4_s_axi_awlock,c0_ddr4_s_axi_awcache,c0_ddr4_s_axi_awprot,c0_ddr4_s_axi_awqos,c0_ddr4_s_axi_awvalid,c0_ddr4_s_axi_awready,c0_ddr4_s_axi_wdata,c0_ddr4_s_axi_wstrb,c0_ddr4_s_axi_wlast,c0_ddr4_s_axi_wvalid,c0_ddr4_s_axi_wready,c0_ddr4_s_axi_bready,c0_ddr4_s_axi_bid,c0_ddr4_s_axi_bresp,c0_ddr4_s_axi_bvalid,c0_ddr4_s_axi_arid,c0_ddr4_s_axi_araddr,c0_ddr4_s_axi_arlen,c0_ddr4_s_axi_arsize,c0_ddr4_s_axi_arburst,c0_ddr4_s_axi_arlock,c0_ddr4_s_axi_arcache,c0_ddr4_s_axi_arprot,c0_ddr4_s_axi_arqos,c0_ddr4_s_axi_arvalid,c0_ddr4_s_axi_arready,c0_ddr4_s_axi_rready,c0_ddr4_s_axi_rlast,c0_ddr4_s_axi_rvalid,c0_ddr4_s_axi_rresp,c0_ddr4_s_axi_rid,c0_ddr4_s_axi_rdata,sys_rst)
(* integer foreign = "SystemC";
*);
  output wire c0_init_calib_complete;
  output wire dbg_clk;
  input bit c0_sys_clk_p;
  input bit c0_sys_clk_n;
  output wire [511 : 0] dbg_bus;
  output wire [16 : 0] c0_ddr4_adr;
  output wire [1 : 0] c0_ddr4_ba;
  output wire [0 : 0] c0_ddr4_cke;
  output wire [0 : 0] c0_ddr4_cs_n;
  inout wire [3 : 0] c0_ddr4_dm_dbi_n;
  inout wire [31 : 0] c0_ddr4_dq;
  inout wire [3 : 0] c0_ddr4_dqs_c;
  inout wire [3 : 0] c0_ddr4_dqs_t;
  output wire [0 : 0] c0_ddr4_odt;
  output wire [0 : 0] c0_ddr4_bg;
  output wire c0_ddr4_reset_n;
  output wire c0_ddr4_act_n;
  output wire [0 : 0] c0_ddr4_ck_c;
  output wire [0 : 0] c0_ddr4_ck_t;
  output wire c0_ddr4_ui_clk;
  output wire c0_ddr4_ui_clk_sync_rst;
  input bit c0_ddr4_aresetn;
  input bit [0 : 0] c0_ddr4_s_axi_awid;
  input bit [30 : 0] c0_ddr4_s_axi_awaddr;
  input bit [7 : 0] c0_ddr4_s_axi_awlen;
  input bit [2 : 0] c0_ddr4_s_axi_awsize;
  input bit [1 : 0] c0_ddr4_s_axi_awburst;
  input bit [0 : 0] c0_ddr4_s_axi_awlock;
  input bit [3 : 0] c0_ddr4_s_axi_awcache;
  input bit [2 : 0] c0_ddr4_s_axi_awprot;
  input bit [3 : 0] c0_ddr4_s_axi_awqos;
  input bit c0_ddr4_s_axi_awvalid;
  output wire c0_ddr4_s_axi_awready;
  input bit [255 : 0] c0_ddr4_s_axi_wdata;
  input bit [31 : 0] c0_ddr4_s_axi_wstrb;
  input bit c0_ddr4_s_axi_wlast;
  input bit c0_ddr4_s_axi_wvalid;
  output wire c0_ddr4_s_axi_wready;
  input bit c0_ddr4_s_axi_bready;
  output wire [0 : 0] c0_ddr4_s_axi_bid;
  output wire [1 : 0] c0_ddr4_s_axi_bresp;
  output wire c0_ddr4_s_axi_bvalid;
  input bit [0 : 0] c0_ddr4_s_axi_arid;
  input bit [30 : 0] c0_ddr4_s_axi_araddr;
  input bit [7 : 0] c0_ddr4_s_axi_arlen;
  input bit [2 : 0] c0_ddr4_s_axi_arsize;
  input bit [1 : 0] c0_ddr4_s_axi_arburst;
  input bit [0 : 0] c0_ddr4_s_axi_arlock;
  input bit [3 : 0] c0_ddr4_s_axi_arcache;
  input bit [2 : 0] c0_ddr4_s_axi_arprot;
  input bit [3 : 0] c0_ddr4_s_axi_arqos;
  input bit c0_ddr4_s_axi_arvalid;
  output wire c0_ddr4_s_axi_arready;
  input bit c0_ddr4_s_axi_rready;
  output wire c0_ddr4_s_axi_rlast;
  output wire c0_ddr4_s_axi_rvalid;
  output wire [1 : 0] c0_ddr4_s_axi_rresp;
  output wire [0 : 0] c0_ddr4_s_axi_rid;
  output wire [255 : 0] c0_ddr4_s_axi_rdata;
  input bit sys_rst;
endmodule
`endif
