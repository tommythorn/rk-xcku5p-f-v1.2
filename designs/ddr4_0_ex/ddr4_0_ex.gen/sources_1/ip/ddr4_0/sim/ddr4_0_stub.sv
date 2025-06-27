// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
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
// Filename:    ddr4_0_stub.sv
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
module ddr4_0 (
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
  input bit_as_bool c0_ddr4_app_en,
  input bit_as_bool c0_ddr4_app_hi_pri,
  input bit_as_bool c0_ddr4_app_wdf_end,
  input bit_as_bool c0_ddr4_app_wdf_wren,
  output bit_as_bool c0_ddr4_app_rd_data_end,
  output bit_as_bool c0_ddr4_app_rd_data_valid,
  output bit_as_bool c0_ddr4_app_rdy,
  output bit_as_bool c0_ddr4_app_wdf_rdy,
  input bit [28 : 0] c0_ddr4_app_addr,
  input bit [2 : 0] c0_ddr4_app_cmd,
  input bit [255 : 0] c0_ddr4_app_wdf_data,
  input bit [31 : 0] c0_ddr4_app_wdf_mask,
  output bit [255 : 0] c0_ddr4_app_rd_data,
  input bit_as_bool sys_rst
);
endmodule
`endif

`ifdef XCELIUM
(* XMSC_MODULE_EXPORT *)
module ddr4_0 (c0_init_calib_complete,dbg_clk,c0_sys_clk_p,c0_sys_clk_n,dbg_bus,c0_ddr4_adr,c0_ddr4_ba,c0_ddr4_cke,c0_ddr4_cs_n,c0_ddr4_dm_dbi_n,c0_ddr4_dq,c0_ddr4_dqs_c,c0_ddr4_dqs_t,c0_ddr4_odt,c0_ddr4_bg,c0_ddr4_reset_n,c0_ddr4_act_n,c0_ddr4_ck_c,c0_ddr4_ck_t,c0_ddr4_ui_clk,c0_ddr4_ui_clk_sync_rst,c0_ddr4_app_en,c0_ddr4_app_hi_pri,c0_ddr4_app_wdf_end,c0_ddr4_app_wdf_wren,c0_ddr4_app_rd_data_end,c0_ddr4_app_rd_data_valid,c0_ddr4_app_rdy,c0_ddr4_app_wdf_rdy,c0_ddr4_app_addr,c0_ddr4_app_cmd,c0_ddr4_app_wdf_data,c0_ddr4_app_wdf_mask,c0_ddr4_app_rd_data,sys_rst)
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
  input bit c0_ddr4_app_en;
  input bit c0_ddr4_app_hi_pri;
  input bit c0_ddr4_app_wdf_end;
  input bit c0_ddr4_app_wdf_wren;
  output wire c0_ddr4_app_rd_data_end;
  output wire c0_ddr4_app_rd_data_valid;
  output wire c0_ddr4_app_rdy;
  output wire c0_ddr4_app_wdf_rdy;
  input bit [28 : 0] c0_ddr4_app_addr;
  input bit [2 : 0] c0_ddr4_app_cmd;
  input bit [255 : 0] c0_ddr4_app_wdf_data;
  input bit [31 : 0] c0_ddr4_app_wdf_mask;
  output wire [255 : 0] c0_ddr4_app_rd_data;
  input bit sys_rst;
endmodule
`endif
