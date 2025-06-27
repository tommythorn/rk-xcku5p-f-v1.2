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


#include "ddr4_0_sc.h"

#include "ddr4_0.h"

#include "sim_ddr_v2_0.h"

#include <map>
#include <string>





#ifdef XILINX_SIMULATOR
ddr4_0::ddr4_0(const sc_core::sc_module_name& nm) : ddr4_0_sc(nm), c0_init_calib_complete("c0_init_calib_complete"), dbg_clk("dbg_clk"), c0_sys_clk_p("c0_sys_clk_p"), c0_sys_clk_n("c0_sys_clk_n"), dbg_bus("dbg_bus"), c0_ddr4_adr("c0_ddr4_adr"), c0_ddr4_ba("c0_ddr4_ba"), c0_ddr4_cke("c0_ddr4_cke"), c0_ddr4_cs_n("c0_ddr4_cs_n"), c0_ddr4_dm_dbi_n("c0_ddr4_dm_dbi_n"), c0_ddr4_dq("c0_ddr4_dq"), c0_ddr4_dqs_c("c0_ddr4_dqs_c"), c0_ddr4_dqs_t("c0_ddr4_dqs_t"), c0_ddr4_odt("c0_ddr4_odt"), c0_ddr4_bg("c0_ddr4_bg"), c0_ddr4_reset_n("c0_ddr4_reset_n"), c0_ddr4_act_n("c0_ddr4_act_n"), c0_ddr4_ck_c("c0_ddr4_ck_c"), c0_ddr4_ck_t("c0_ddr4_ck_t"), c0_ddr4_ui_clk("c0_ddr4_ui_clk"), c0_ddr4_ui_clk_sync_rst("c0_ddr4_ui_clk_sync_rst"), c0_ddr4_app_en("c0_ddr4_app_en"), c0_ddr4_app_hi_pri("c0_ddr4_app_hi_pri"), c0_ddr4_app_wdf_end("c0_ddr4_app_wdf_end"), c0_ddr4_app_wdf_wren("c0_ddr4_app_wdf_wren"), c0_ddr4_app_rd_data_end("c0_ddr4_app_rd_data_end"), c0_ddr4_app_rd_data_valid("c0_ddr4_app_rd_data_valid"), c0_ddr4_app_rdy("c0_ddr4_app_rdy"), c0_ddr4_app_wdf_rdy("c0_ddr4_app_wdf_rdy"), c0_ddr4_app_addr("c0_ddr4_app_addr"), c0_ddr4_app_cmd("c0_ddr4_app_cmd"), c0_ddr4_app_wdf_data("c0_ddr4_app_wdf_data"), c0_ddr4_app_wdf_mask("c0_ddr4_app_wdf_mask"), c0_ddr4_app_rd_data("c0_ddr4_app_rd_data"), sys_rst("sys_rst")
{

  // initialize pins
  mp_impl->c0_init_calib_complete(c0_init_calib_complete);
  mp_impl->dbg_clk(dbg_clk);
  mp_impl->c0_sys_clk_p(c0_sys_clk_p);
  mp_impl->c0_sys_clk_n(c0_sys_clk_n);
  mp_impl->dbg_bus(dbg_bus);
  mp_impl->c0_ddr4_adr(c0_ddr4_adr);
  mp_impl->c0_ddr4_ba(c0_ddr4_ba);
  mp_impl->c0_ddr4_cke(c0_ddr4_cke);
  mp_impl->c0_ddr4_cs_n(c0_ddr4_cs_n);
  mp_impl->c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n);
  mp_impl->c0_ddr4_dq(c0_ddr4_dq);
  mp_impl->c0_ddr4_dqs_c(c0_ddr4_dqs_c);
  mp_impl->c0_ddr4_dqs_t(c0_ddr4_dqs_t);
  mp_impl->c0_ddr4_odt(c0_ddr4_odt);
  mp_impl->c0_ddr4_bg(c0_ddr4_bg);
  mp_impl->c0_ddr4_reset_n(c0_ddr4_reset_n);
  mp_impl->c0_ddr4_act_n(c0_ddr4_act_n);
  mp_impl->c0_ddr4_ck_c(c0_ddr4_ck_c);
  mp_impl->c0_ddr4_ck_t(c0_ddr4_ck_t);
  mp_impl->c0_ddr4_ui_clk(c0_ddr4_ui_clk);
  mp_impl->c0_ddr4_ui_clk_sync_rst(c0_ddr4_ui_clk_sync_rst);
  mp_impl->c0_ddr4_app_en(c0_ddr4_app_en);
  mp_impl->c0_ddr4_app_hi_pri(c0_ddr4_app_hi_pri);
  mp_impl->c0_ddr4_app_wdf_end(c0_ddr4_app_wdf_end);
  mp_impl->c0_ddr4_app_wdf_wren(c0_ddr4_app_wdf_wren);
  mp_impl->c0_ddr4_app_rd_data_end(c0_ddr4_app_rd_data_end);
  mp_impl->c0_ddr4_app_rd_data_valid(c0_ddr4_app_rd_data_valid);
  mp_impl->c0_ddr4_app_rdy(c0_ddr4_app_rdy);
  mp_impl->c0_ddr4_app_wdf_rdy(c0_ddr4_app_wdf_rdy);
  mp_impl->c0_ddr4_app_addr(c0_ddr4_app_addr);
  mp_impl->c0_ddr4_app_cmd(c0_ddr4_app_cmd);
  mp_impl->c0_ddr4_app_wdf_data(c0_ddr4_app_wdf_data);
  mp_impl->c0_ddr4_app_wdf_mask(c0_ddr4_app_wdf_mask);
  mp_impl->c0_ddr4_app_rd_data(c0_ddr4_app_rd_data);
  mp_impl->sys_rst(sys_rst);

}

void ddr4_0::before_end_of_elaboration()
{
}

#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
ddr4_0::ddr4_0(const sc_core::sc_module_name& nm) : ddr4_0_sc(nm), c0_init_calib_complete("c0_init_calib_complete"), dbg_clk("dbg_clk"), c0_sys_clk_p("c0_sys_clk_p"), c0_sys_clk_n("c0_sys_clk_n"), dbg_bus("dbg_bus"), c0_ddr4_adr("c0_ddr4_adr"), c0_ddr4_ba("c0_ddr4_ba"), c0_ddr4_cke("c0_ddr4_cke"), c0_ddr4_cs_n("c0_ddr4_cs_n"), c0_ddr4_dm_dbi_n("c0_ddr4_dm_dbi_n"), c0_ddr4_dq("c0_ddr4_dq"), c0_ddr4_dqs_c("c0_ddr4_dqs_c"), c0_ddr4_dqs_t("c0_ddr4_dqs_t"), c0_ddr4_odt("c0_ddr4_odt"), c0_ddr4_bg("c0_ddr4_bg"), c0_ddr4_reset_n("c0_ddr4_reset_n"), c0_ddr4_act_n("c0_ddr4_act_n"), c0_ddr4_ck_c("c0_ddr4_ck_c"), c0_ddr4_ck_t("c0_ddr4_ck_t"), c0_ddr4_ui_clk("c0_ddr4_ui_clk"), c0_ddr4_ui_clk_sync_rst("c0_ddr4_ui_clk_sync_rst"), c0_ddr4_app_en("c0_ddr4_app_en"), c0_ddr4_app_hi_pri("c0_ddr4_app_hi_pri"), c0_ddr4_app_wdf_end("c0_ddr4_app_wdf_end"), c0_ddr4_app_wdf_wren("c0_ddr4_app_wdf_wren"), c0_ddr4_app_rd_data_end("c0_ddr4_app_rd_data_end"), c0_ddr4_app_rd_data_valid("c0_ddr4_app_rd_data_valid"), c0_ddr4_app_rdy("c0_ddr4_app_rdy"), c0_ddr4_app_wdf_rdy("c0_ddr4_app_wdf_rdy"), c0_ddr4_app_addr("c0_ddr4_app_addr"), c0_ddr4_app_cmd("c0_ddr4_app_cmd"), c0_ddr4_app_wdf_data("c0_ddr4_app_wdf_data"), c0_ddr4_app_wdf_mask("c0_ddr4_app_wdf_mask"), c0_ddr4_app_rd_data("c0_ddr4_app_rd_data"), sys_rst("sys_rst")
{

  // initialize pins
  mp_impl->c0_init_calib_complete(c0_init_calib_complete);
  mp_impl->dbg_clk(dbg_clk);
  mp_impl->c0_sys_clk_p(c0_sys_clk_p);
  mp_impl->c0_sys_clk_n(c0_sys_clk_n);
  mp_impl->dbg_bus(dbg_bus);
  mp_impl->c0_ddr4_adr(c0_ddr4_adr);
  mp_impl->c0_ddr4_ba(c0_ddr4_ba);
  mp_impl->c0_ddr4_cke(c0_ddr4_cke);
  mp_impl->c0_ddr4_cs_n(c0_ddr4_cs_n);
  mp_impl->c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n);
  mp_impl->c0_ddr4_dq(c0_ddr4_dq);
  mp_impl->c0_ddr4_dqs_c(c0_ddr4_dqs_c);
  mp_impl->c0_ddr4_dqs_t(c0_ddr4_dqs_t);
  mp_impl->c0_ddr4_odt(c0_ddr4_odt);
  mp_impl->c0_ddr4_bg(c0_ddr4_bg);
  mp_impl->c0_ddr4_reset_n(c0_ddr4_reset_n);
  mp_impl->c0_ddr4_act_n(c0_ddr4_act_n);
  mp_impl->c0_ddr4_ck_c(c0_ddr4_ck_c);
  mp_impl->c0_ddr4_ck_t(c0_ddr4_ck_t);
  mp_impl->c0_ddr4_ui_clk(c0_ddr4_ui_clk);
  mp_impl->c0_ddr4_ui_clk_sync_rst(c0_ddr4_ui_clk_sync_rst);
  mp_impl->c0_ddr4_app_en(c0_ddr4_app_en);
  mp_impl->c0_ddr4_app_hi_pri(c0_ddr4_app_hi_pri);
  mp_impl->c0_ddr4_app_wdf_end(c0_ddr4_app_wdf_end);
  mp_impl->c0_ddr4_app_wdf_wren(c0_ddr4_app_wdf_wren);
  mp_impl->c0_ddr4_app_rd_data_end(c0_ddr4_app_rd_data_end);
  mp_impl->c0_ddr4_app_rd_data_valid(c0_ddr4_app_rd_data_valid);
  mp_impl->c0_ddr4_app_rdy(c0_ddr4_app_rdy);
  mp_impl->c0_ddr4_app_wdf_rdy(c0_ddr4_app_wdf_rdy);
  mp_impl->c0_ddr4_app_addr(c0_ddr4_app_addr);
  mp_impl->c0_ddr4_app_cmd(c0_ddr4_app_cmd);
  mp_impl->c0_ddr4_app_wdf_data(c0_ddr4_app_wdf_data);
  mp_impl->c0_ddr4_app_wdf_mask(c0_ddr4_app_wdf_mask);
  mp_impl->c0_ddr4_app_rd_data(c0_ddr4_app_rd_data);
  mp_impl->sys_rst(sys_rst);

}

void ddr4_0::before_end_of_elaboration()
{
}

#endif // XM_SYSTEMC




#ifdef RIVIERA
ddr4_0::ddr4_0(const sc_core::sc_module_name& nm) : ddr4_0_sc(nm), c0_init_calib_complete("c0_init_calib_complete"), dbg_clk("dbg_clk"), c0_sys_clk_p("c0_sys_clk_p"), c0_sys_clk_n("c0_sys_clk_n"), dbg_bus("dbg_bus"), c0_ddr4_adr("c0_ddr4_adr"), c0_ddr4_ba("c0_ddr4_ba"), c0_ddr4_cke("c0_ddr4_cke"), c0_ddr4_cs_n("c0_ddr4_cs_n"), c0_ddr4_dm_dbi_n("c0_ddr4_dm_dbi_n"), c0_ddr4_dq("c0_ddr4_dq"), c0_ddr4_dqs_c("c0_ddr4_dqs_c"), c0_ddr4_dqs_t("c0_ddr4_dqs_t"), c0_ddr4_odt("c0_ddr4_odt"), c0_ddr4_bg("c0_ddr4_bg"), c0_ddr4_reset_n("c0_ddr4_reset_n"), c0_ddr4_act_n("c0_ddr4_act_n"), c0_ddr4_ck_c("c0_ddr4_ck_c"), c0_ddr4_ck_t("c0_ddr4_ck_t"), c0_ddr4_ui_clk("c0_ddr4_ui_clk"), c0_ddr4_ui_clk_sync_rst("c0_ddr4_ui_clk_sync_rst"), c0_ddr4_app_en("c0_ddr4_app_en"), c0_ddr4_app_hi_pri("c0_ddr4_app_hi_pri"), c0_ddr4_app_wdf_end("c0_ddr4_app_wdf_end"), c0_ddr4_app_wdf_wren("c0_ddr4_app_wdf_wren"), c0_ddr4_app_rd_data_end("c0_ddr4_app_rd_data_end"), c0_ddr4_app_rd_data_valid("c0_ddr4_app_rd_data_valid"), c0_ddr4_app_rdy("c0_ddr4_app_rdy"), c0_ddr4_app_wdf_rdy("c0_ddr4_app_wdf_rdy"), c0_ddr4_app_addr("c0_ddr4_app_addr"), c0_ddr4_app_cmd("c0_ddr4_app_cmd"), c0_ddr4_app_wdf_data("c0_ddr4_app_wdf_data"), c0_ddr4_app_wdf_mask("c0_ddr4_app_wdf_mask"), c0_ddr4_app_rd_data("c0_ddr4_app_rd_data"), sys_rst("sys_rst")
{

  // initialize pins
  mp_impl->c0_init_calib_complete(c0_init_calib_complete);
  mp_impl->dbg_clk(dbg_clk);
  mp_impl->c0_sys_clk_p(c0_sys_clk_p);
  mp_impl->c0_sys_clk_n(c0_sys_clk_n);
  mp_impl->dbg_bus(dbg_bus);
  mp_impl->c0_ddr4_adr(c0_ddr4_adr);
  mp_impl->c0_ddr4_ba(c0_ddr4_ba);
  mp_impl->c0_ddr4_cke(c0_ddr4_cke);
  mp_impl->c0_ddr4_cs_n(c0_ddr4_cs_n);
  mp_impl->c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n);
  mp_impl->c0_ddr4_dq(c0_ddr4_dq);
  mp_impl->c0_ddr4_dqs_c(c0_ddr4_dqs_c);
  mp_impl->c0_ddr4_dqs_t(c0_ddr4_dqs_t);
  mp_impl->c0_ddr4_odt(c0_ddr4_odt);
  mp_impl->c0_ddr4_bg(c0_ddr4_bg);
  mp_impl->c0_ddr4_reset_n(c0_ddr4_reset_n);
  mp_impl->c0_ddr4_act_n(c0_ddr4_act_n);
  mp_impl->c0_ddr4_ck_c(c0_ddr4_ck_c);
  mp_impl->c0_ddr4_ck_t(c0_ddr4_ck_t);
  mp_impl->c0_ddr4_ui_clk(c0_ddr4_ui_clk);
  mp_impl->c0_ddr4_ui_clk_sync_rst(c0_ddr4_ui_clk_sync_rst);
  mp_impl->c0_ddr4_app_en(c0_ddr4_app_en);
  mp_impl->c0_ddr4_app_hi_pri(c0_ddr4_app_hi_pri);
  mp_impl->c0_ddr4_app_wdf_end(c0_ddr4_app_wdf_end);
  mp_impl->c0_ddr4_app_wdf_wren(c0_ddr4_app_wdf_wren);
  mp_impl->c0_ddr4_app_rd_data_end(c0_ddr4_app_rd_data_end);
  mp_impl->c0_ddr4_app_rd_data_valid(c0_ddr4_app_rd_data_valid);
  mp_impl->c0_ddr4_app_rdy(c0_ddr4_app_rdy);
  mp_impl->c0_ddr4_app_wdf_rdy(c0_ddr4_app_wdf_rdy);
  mp_impl->c0_ddr4_app_addr(c0_ddr4_app_addr);
  mp_impl->c0_ddr4_app_cmd(c0_ddr4_app_cmd);
  mp_impl->c0_ddr4_app_wdf_data(c0_ddr4_app_wdf_data);
  mp_impl->c0_ddr4_app_wdf_mask(c0_ddr4_app_wdf_mask);
  mp_impl->c0_ddr4_app_rd_data(c0_ddr4_app_rd_data);
  mp_impl->sys_rst(sys_rst);

}

void ddr4_0::before_end_of_elaboration()
{
}

#endif // RIVIERA




#ifdef VCSSYSTEMC
ddr4_0::ddr4_0(const sc_core::sc_module_name& nm) : ddr4_0_sc(nm),  c0_init_calib_complete("c0_init_calib_complete"), dbg_clk("dbg_clk"), c0_sys_clk_p("c0_sys_clk_p"), c0_sys_clk_n("c0_sys_clk_n"), dbg_bus("dbg_bus"), c0_ddr4_adr("c0_ddr4_adr"), c0_ddr4_ba("c0_ddr4_ba"), c0_ddr4_cke("c0_ddr4_cke"), c0_ddr4_cs_n("c0_ddr4_cs_n"), c0_ddr4_dm_dbi_n("c0_ddr4_dm_dbi_n"), c0_ddr4_dq("c0_ddr4_dq"), c0_ddr4_dqs_c("c0_ddr4_dqs_c"), c0_ddr4_dqs_t("c0_ddr4_dqs_t"), c0_ddr4_odt("c0_ddr4_odt"), c0_ddr4_bg("c0_ddr4_bg"), c0_ddr4_reset_n("c0_ddr4_reset_n"), c0_ddr4_act_n("c0_ddr4_act_n"), c0_ddr4_ck_c("c0_ddr4_ck_c"), c0_ddr4_ck_t("c0_ddr4_ck_t"), c0_ddr4_ui_clk("c0_ddr4_ui_clk"), c0_ddr4_ui_clk_sync_rst("c0_ddr4_ui_clk_sync_rst"), c0_ddr4_app_en("c0_ddr4_app_en"), c0_ddr4_app_hi_pri("c0_ddr4_app_hi_pri"), c0_ddr4_app_wdf_end("c0_ddr4_app_wdf_end"), c0_ddr4_app_wdf_wren("c0_ddr4_app_wdf_wren"), c0_ddr4_app_rd_data_end("c0_ddr4_app_rd_data_end"), c0_ddr4_app_rd_data_valid("c0_ddr4_app_rd_data_valid"), c0_ddr4_app_rdy("c0_ddr4_app_rdy"), c0_ddr4_app_wdf_rdy("c0_ddr4_app_wdf_rdy"), c0_ddr4_app_addr("c0_ddr4_app_addr"), c0_ddr4_app_cmd("c0_ddr4_app_cmd"), c0_ddr4_app_wdf_data("c0_ddr4_app_wdf_data"), c0_ddr4_app_wdf_mask("c0_ddr4_app_wdf_mask"), c0_ddr4_app_rd_data("c0_ddr4_app_rd_data"), sys_rst("sys_rst")
{
  // initialize pins
  mp_impl->c0_init_calib_complete(c0_init_calib_complete);
  mp_impl->dbg_clk(dbg_clk);
  mp_impl->c0_sys_clk_p(c0_sys_clk_p);
  mp_impl->c0_sys_clk_n(c0_sys_clk_n);
  mp_impl->dbg_bus(dbg_bus);
  mp_impl->c0_ddr4_adr(c0_ddr4_adr);
  mp_impl->c0_ddr4_ba(c0_ddr4_ba);
  mp_impl->c0_ddr4_cke(c0_ddr4_cke);
  mp_impl->c0_ddr4_cs_n(c0_ddr4_cs_n);
  mp_impl->c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n);
  mp_impl->c0_ddr4_dq(c0_ddr4_dq);
  mp_impl->c0_ddr4_dqs_c(c0_ddr4_dqs_c);
  mp_impl->c0_ddr4_dqs_t(c0_ddr4_dqs_t);
  mp_impl->c0_ddr4_odt(c0_ddr4_odt);
  mp_impl->c0_ddr4_bg(c0_ddr4_bg);
  mp_impl->c0_ddr4_reset_n(c0_ddr4_reset_n);
  mp_impl->c0_ddr4_act_n(c0_ddr4_act_n);
  mp_impl->c0_ddr4_ck_c(c0_ddr4_ck_c);
  mp_impl->c0_ddr4_ck_t(c0_ddr4_ck_t);
  mp_impl->c0_ddr4_ui_clk(c0_ddr4_ui_clk);
  mp_impl->c0_ddr4_ui_clk_sync_rst(c0_ddr4_ui_clk_sync_rst);
  mp_impl->c0_ddr4_app_en(c0_ddr4_app_en);
  mp_impl->c0_ddr4_app_hi_pri(c0_ddr4_app_hi_pri);
  mp_impl->c0_ddr4_app_wdf_end(c0_ddr4_app_wdf_end);
  mp_impl->c0_ddr4_app_wdf_wren(c0_ddr4_app_wdf_wren);
  mp_impl->c0_ddr4_app_rd_data_end(c0_ddr4_app_rd_data_end);
  mp_impl->c0_ddr4_app_rd_data_valid(c0_ddr4_app_rd_data_valid);
  mp_impl->c0_ddr4_app_rdy(c0_ddr4_app_rdy);
  mp_impl->c0_ddr4_app_wdf_rdy(c0_ddr4_app_wdf_rdy);
  mp_impl->c0_ddr4_app_addr(c0_ddr4_app_addr);
  mp_impl->c0_ddr4_app_cmd(c0_ddr4_app_cmd);
  mp_impl->c0_ddr4_app_wdf_data(c0_ddr4_app_wdf_data);
  mp_impl->c0_ddr4_app_wdf_mask(c0_ddr4_app_wdf_mask);
  mp_impl->c0_ddr4_app_rd_data(c0_ddr4_app_rd_data);
  mp_impl->sys_rst(sys_rst);

  // Instantiate Socket Stubs


}

void ddr4_0::before_end_of_elaboration()
{
}

#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
ddr4_0::ddr4_0(const sc_core::sc_module_name& nm) : ddr4_0_sc(nm),  c0_init_calib_complete("c0_init_calib_complete"), dbg_clk("dbg_clk"), c0_sys_clk_p("c0_sys_clk_p"), c0_sys_clk_n("c0_sys_clk_n"), dbg_bus("dbg_bus"), c0_ddr4_adr("c0_ddr4_adr"), c0_ddr4_ba("c0_ddr4_ba"), c0_ddr4_cke("c0_ddr4_cke"), c0_ddr4_cs_n("c0_ddr4_cs_n"), c0_ddr4_dm_dbi_n("c0_ddr4_dm_dbi_n"), c0_ddr4_dq("c0_ddr4_dq"), c0_ddr4_dqs_c("c0_ddr4_dqs_c"), c0_ddr4_dqs_t("c0_ddr4_dqs_t"), c0_ddr4_odt("c0_ddr4_odt"), c0_ddr4_bg("c0_ddr4_bg"), c0_ddr4_reset_n("c0_ddr4_reset_n"), c0_ddr4_act_n("c0_ddr4_act_n"), c0_ddr4_ck_c("c0_ddr4_ck_c"), c0_ddr4_ck_t("c0_ddr4_ck_t"), c0_ddr4_ui_clk("c0_ddr4_ui_clk"), c0_ddr4_ui_clk_sync_rst("c0_ddr4_ui_clk_sync_rst"), c0_ddr4_app_en("c0_ddr4_app_en"), c0_ddr4_app_hi_pri("c0_ddr4_app_hi_pri"), c0_ddr4_app_wdf_end("c0_ddr4_app_wdf_end"), c0_ddr4_app_wdf_wren("c0_ddr4_app_wdf_wren"), c0_ddr4_app_rd_data_end("c0_ddr4_app_rd_data_end"), c0_ddr4_app_rd_data_valid("c0_ddr4_app_rd_data_valid"), c0_ddr4_app_rdy("c0_ddr4_app_rdy"), c0_ddr4_app_wdf_rdy("c0_ddr4_app_wdf_rdy"), c0_ddr4_app_addr("c0_ddr4_app_addr"), c0_ddr4_app_cmd("c0_ddr4_app_cmd"), c0_ddr4_app_wdf_data("c0_ddr4_app_wdf_data"), c0_ddr4_app_wdf_mask("c0_ddr4_app_wdf_mask"), c0_ddr4_app_rd_data("c0_ddr4_app_rd_data"), sys_rst("sys_rst")
{
  // initialize pins
  mp_impl->c0_init_calib_complete(c0_init_calib_complete);
  mp_impl->dbg_clk(dbg_clk);
  mp_impl->c0_sys_clk_p(c0_sys_clk_p);
  mp_impl->c0_sys_clk_n(c0_sys_clk_n);
  mp_impl->dbg_bus(dbg_bus);
  mp_impl->c0_ddr4_adr(c0_ddr4_adr);
  mp_impl->c0_ddr4_ba(c0_ddr4_ba);
  mp_impl->c0_ddr4_cke(c0_ddr4_cke);
  mp_impl->c0_ddr4_cs_n(c0_ddr4_cs_n);
  mp_impl->c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n);
  mp_impl->c0_ddr4_dq(c0_ddr4_dq);
  mp_impl->c0_ddr4_dqs_c(c0_ddr4_dqs_c);
  mp_impl->c0_ddr4_dqs_t(c0_ddr4_dqs_t);
  mp_impl->c0_ddr4_odt(c0_ddr4_odt);
  mp_impl->c0_ddr4_bg(c0_ddr4_bg);
  mp_impl->c0_ddr4_reset_n(c0_ddr4_reset_n);
  mp_impl->c0_ddr4_act_n(c0_ddr4_act_n);
  mp_impl->c0_ddr4_ck_c(c0_ddr4_ck_c);
  mp_impl->c0_ddr4_ck_t(c0_ddr4_ck_t);
  mp_impl->c0_ddr4_ui_clk(c0_ddr4_ui_clk);
  mp_impl->c0_ddr4_ui_clk_sync_rst(c0_ddr4_ui_clk_sync_rst);
  mp_impl->c0_ddr4_app_en(c0_ddr4_app_en);
  mp_impl->c0_ddr4_app_hi_pri(c0_ddr4_app_hi_pri);
  mp_impl->c0_ddr4_app_wdf_end(c0_ddr4_app_wdf_end);
  mp_impl->c0_ddr4_app_wdf_wren(c0_ddr4_app_wdf_wren);
  mp_impl->c0_ddr4_app_rd_data_end(c0_ddr4_app_rd_data_end);
  mp_impl->c0_ddr4_app_rd_data_valid(c0_ddr4_app_rd_data_valid);
  mp_impl->c0_ddr4_app_rdy(c0_ddr4_app_rdy);
  mp_impl->c0_ddr4_app_wdf_rdy(c0_ddr4_app_wdf_rdy);
  mp_impl->c0_ddr4_app_addr(c0_ddr4_app_addr);
  mp_impl->c0_ddr4_app_cmd(c0_ddr4_app_cmd);
  mp_impl->c0_ddr4_app_wdf_data(c0_ddr4_app_wdf_data);
  mp_impl->c0_ddr4_app_wdf_mask(c0_ddr4_app_wdf_mask);
  mp_impl->c0_ddr4_app_rd_data(c0_ddr4_app_rd_data);
  mp_impl->sys_rst(sys_rst);

  // Instantiate Socket Stubs


}

void ddr4_0::before_end_of_elaboration()
{
}

#endif // MTI_SYSTEMC




ddr4_0::~ddr4_0()
{
}

#ifdef MTI_SYSTEMC
SC_MODULE_EXPORT(ddr4_0);
#endif

#ifdef XM_SYSTEMC
XMSC_MODULE_EXPORT(ddr4_0);
#endif

#ifdef RIVIERA
SC_MODULE_EXPORT(ddr4_0);
SC_REGISTER_BV(512);
#endif

