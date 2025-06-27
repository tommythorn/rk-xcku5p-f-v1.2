

/******************************************************************************
// (c) Copyright 2013 - 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
******************************************************************************/
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor             : Xilinx
// \   \   \/     Version            : 1.0
//  \   \         Application        : MIG
//  /   /         Filename           : example_top.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu Apr 18 2013
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : DDR4_SDRAM
// Purpose          :
//                    Top-level  module. This module serves both as an example,
//                    and allows the user to synthesize a self-contained
//                    design, which they can be used to test their hardware.
//                    In addition to the memory controller,
//                    the module instantiates:
//                      1. Synthesizable testbench - used to model
//                      user's backend logic and generate different
//                      traffic patterns
//
// Reference        :
// Revision History :
//*****************************************************************************
`ifdef MODEL_TECH
    `define SIMULATION_MODE
`elsif INCA
    `define SIMULATION_MODE
`elsif VCS
    `define SIMULATION_MODE
`elsif XILINX_SIMULATOR
    `define SIMULATION_MODE
`elsif _VCP
    `define SIMULATION_MODE
`endif


`timescale 1ps/1ps
module example_top #
  (
    parameter nCK_PER_CLK           = 4,   // This parameter is controllerwise
    parameter         APP_DATA_WIDTH          = 256, // This parameter is controllerwise
    parameter         APP_MASK_WIDTH          = 32,  // This parameter is controllerwise
  `ifdef SIMULATION_MODE
    parameter SIMULATION            = "TRUE" 
  `else
    parameter SIMULATION            = "FALSE"
  `endif

  )
   (
    input                 sys_rst, //Common port for all controllers

    output                  c0_init_calib_complete,
    output                  c0_data_compare_error,
    input                   c0_sys_clk_p,
    input                   c0_sys_clk_n,
    output                  c0_ddr4_act_n,
    output [16:0]            c0_ddr4_adr,
    output [1:0]            c0_ddr4_ba,
    output [0:0]            c0_ddr4_bg,
    output [0:0]            c0_ddr4_cke,
    output [0:0]            c0_ddr4_odt,
    output [0:0]            c0_ddr4_cs_n,
    output [0:0]                 c0_ddr4_ck_t,
    output [0:0]                c0_ddr4_ck_c,
    output                  c0_ddr4_reset_n,
    inout  [3:0]            c0_ddr4_dm_dbi_n,
    inout  [31:0]            c0_ddr4_dq,
    inout  [3:0]            c0_ddr4_dqs_t,
    inout  [3:0]            c0_ddr4_dqs_c
    );


  localparam  APP_ADDR_WIDTH = 29;
  localparam  MEM_ADDR_ORDER = "ROW_COLUMN_BANK";
  localparam DBG_WR_STS_WIDTH      = 32;
  localparam DBG_RD_STS_WIDTH      = 32;
  localparam ECC                   = "OFF";

wire prbs_mode_done;



  wire [APP_ADDR_WIDTH-1:0]            c0_ddr4_app_addr;
  wire [2:0]            c0_ddr4_app_cmd;
  wire                  c0_ddr4_app_en;
  wire [APP_DATA_WIDTH-1:0]            c0_ddr4_app_wdf_data;
  wire                  c0_ddr4_app_wdf_end;
  wire [APP_MASK_WIDTH-1:0]            c0_ddr4_app_wdf_mask;
  wire                  c0_ddr4_app_wdf_wren;
  wire [APP_DATA_WIDTH-1:0]            c0_ddr4_app_rd_data;
  wire                  c0_ddr4_app_rd_data_end;
  wire                  c0_ddr4_app_rd_data_valid;
  wire                  c0_ddr4_app_rdy;
  wire                  c0_ddr4_app_wdf_rdy;
  wire                  c0_ddr4_clk;
  wire                  c0_ddr4_rst;
  wire                  dbg_clk;
  wire                  c0_wr_rd_complete;



  //HW TG VIO signals
  wire [3:0]                           vio_tg_status_state;
  wire                                 vio_tg_status_err_bit_valid;
  wire [APP_DATA_WIDTH-1:0]            vio_tg_status_err_bit;
  wire [31:0]                          vio_tg_status_err_cnt;
  wire [APP_ADDR_WIDTH-1:0]            vio_tg_status_err_addr;
  wire                                 vio_tg_status_exp_bit_valid;
  wire [APP_DATA_WIDTH-1:0]            vio_tg_status_exp_bit;
  wire                                 vio_tg_status_read_bit_valid;
  wire [APP_DATA_WIDTH-1:0]            vio_tg_status_read_bit;
  wire                                 vio_tg_status_first_err_bit_valid;

  wire [APP_DATA_WIDTH-1:0]            vio_tg_status_first_err_bit;
  wire [APP_ADDR_WIDTH-1:0]            vio_tg_status_first_err_addr;
  wire                                 vio_tg_status_first_exp_bit_valid;
  wire [APP_DATA_WIDTH-1:0]            vio_tg_status_first_exp_bit;
  wire                                 vio_tg_status_first_read_bit_valid;
  wire [APP_DATA_WIDTH-1:0]            vio_tg_status_first_read_bit;
  wire                                 vio_tg_status_err_bit_sticky_valid;
  wire [APP_DATA_WIDTH-1:0]            vio_tg_status_err_bit_sticky;
  wire [31:0]                          vio_tg_status_err_cnt_sticky;
  wire                                 vio_tg_status_err_type_valid;
  wire                                 vio_tg_status_err_type;
  wire                                 vio_tg_status_wr_done;
  wire                                 vio_tg_status_done;
  wire                                 vio_tg_status_watch_dog_hang;
  wire                                 tg_ila_debug;

  // Debug Bus
  wire [511:0]                         dbg_bus;        





wire c0_ddr4_reset_n_int;
  assign c0_ddr4_reset_n = c0_ddr4_reset_n_int;

//***************************************************************************
// The User design is instantiated below. The memory interface ports are
// connected to the top-level and the application interface ports are
// connected to the traffic generator module. This provides a reference
// for connecting the memory controller to system.
//***************************************************************************

  // user design top is one instance for all controllers
ddr4_0 u_ddr4_0
  (
   .sys_rst           (~sys_rst),

   .c0_sys_clk_p                   (c0_sys_clk_p),
   .c0_sys_clk_n                   (c0_sys_clk_n),
   .c0_init_calib_complete (c0_init_calib_complete),
   .c0_ddr4_act_n          (c0_ddr4_act_n),
   .c0_ddr4_adr            (c0_ddr4_adr),
   .c0_ddr4_ba             (c0_ddr4_ba),
   .c0_ddr4_bg             (c0_ddr4_bg),
   .c0_ddr4_cke            (c0_ddr4_cke),
   .c0_ddr4_odt            (c0_ddr4_odt),
   .c0_ddr4_cs_n           (c0_ddr4_cs_n),
   .c0_ddr4_ck_t           (c0_ddr4_ck_t),
   .c0_ddr4_ck_c           (c0_ddr4_ck_c),
   .c0_ddr4_reset_n        (c0_ddr4_reset_n_int),

   .c0_ddr4_dm_dbi_n       (c0_ddr4_dm_dbi_n),
   .c0_ddr4_dq             (c0_ddr4_dq),
   .c0_ddr4_dqs_c          (c0_ddr4_dqs_c),
   .c0_ddr4_dqs_t          (c0_ddr4_dqs_t),

   .c0_ddr4_ui_clk                (c0_ddr4_clk),
   .c0_ddr4_ui_clk_sync_rst       (c0_ddr4_rst),
   .dbg_clk                                    (dbg_clk),

   .c0_ddr4_app_addr              (c0_ddr4_app_addr),
   .c0_ddr4_app_cmd               (c0_ddr4_app_cmd),
   .c0_ddr4_app_en                (c0_ddr4_app_en),
   .c0_ddr4_app_hi_pri            (1'b0),
   .c0_ddr4_app_wdf_data          (c0_ddr4_app_wdf_data),
   .c0_ddr4_app_wdf_end           (c0_ddr4_app_wdf_end),
   .c0_ddr4_app_wdf_mask          (c0_ddr4_app_wdf_mask),
   .c0_ddr4_app_wdf_wren          (c0_ddr4_app_wdf_wren),
   .c0_ddr4_app_rd_data           (c0_ddr4_app_rd_data),
   .c0_ddr4_app_rd_data_end       (c0_ddr4_app_rd_data_end),
   .c0_ddr4_app_rd_data_valid     (c0_ddr4_app_rd_data_valid),
   .c0_ddr4_app_rdy               (c0_ddr4_app_rdy),
   .c0_ddr4_app_wdf_rdy           (c0_ddr4_app_wdf_rdy),
  
  // Debug Port
  .dbg_bus         (dbg_bus)                                             

  );

//***************************************************************************
// The example testbench module instantiated below drives traffic (patterns)
// on the application interface of the memory controller
//***************************************************************************
// In DDR4, there are two test generators (TG) available for user to select:
//  1) Simple Test Generator (STG)
//  2) Advanced Test Generator (ATG)
// 


  `ifndef HW_TG_EN
    example_tb #
      (
       .SIMULATION     (SIMULATION),
       .APP_DATA_WIDTH (APP_DATA_WIDTH),
       .APP_ADDR_WIDTH (APP_ADDR_WIDTH),
       .MEM_ADDR_ORDER (MEM_ADDR_ORDER)
       )
      u_example_tb
        (
         .clk                                     (c0_ddr4_clk),
         .rst                                     (c0_ddr4_rst),
         .app_rdy                                 (c0_ddr4_app_rdy),
         .init_calib_complete                     (c0_init_calib_complete),
         .app_rd_data_valid                       (c0_ddr4_app_rd_data_valid),
         .app_rd_data                             (c0_ddr4_app_rd_data),
         .app_wdf_rdy                             (c0_ddr4_app_wdf_rdy),
         .app_en                                  (c0_ddr4_app_en),
         .app_cmd                                 (c0_ddr4_app_cmd),
         .app_addr                                (c0_ddr4_app_addr),
         .app_wdf_wren                            (c0_ddr4_app_wdf_wren),
         .app_wdf_end                             (c0_ddr4_app_wdf_end),
         .app_wdf_mask                            (c0_ddr4_app_wdf_mask),
         .app_wdf_data                            (c0_ddr4_app_wdf_data),
         .compare_error                           (c0_data_compare_error),
         .wr_rd_complete                          (c0_wr_rd_complete)
      );
   `else
    ddr4_v2_2_19_hw_tg #
      (
       .SIMULATION      (SIMULATION),
       .MEM_TYPE        ("DDR4"),
       .APP_DATA_WIDTH  (APP_DATA_WIDTH),
       .APP_ADDR_WIDTH  (APP_ADDR_WIDTH),
       .NUM_DQ_PINS     (32),
       .ECC             (ECC),
       .DEFAULT_MODE    ("2015_3")
       )
      u_hw_tg
        (
         .clk                  (c0_ddr4_clk),
         .rst                  (c0_ddr4_rst),
         .init_calib_complete  (c0_init_calib_complete),
         .app_rdy              (c0_ddr4_app_rdy),
         .app_wdf_rdy          (c0_ddr4_app_wdf_rdy),
         .app_rd_data_valid    (c0_ddr4_app_rd_data_valid),
         .app_rd_data          (c0_ddr4_app_rd_data),
         .app_cmd              (c0_ddr4_app_cmd),
         .app_addr             (c0_ddr4_app_addr),
         .app_en               (c0_ddr4_app_en),
         .app_wdf_mask         (c0_ddr4_app_wdf_mask),
         .app_wdf_data         (c0_ddr4_app_wdf_data),
         .app_wdf_end          (c0_ddr4_app_wdf_end),
         .app_wdf_wren         (c0_ddr4_app_wdf_wren),
         .app_wdf_en           (), // valid for QDRII+ only
         .app_wdf_addr         (), // valid for QDRII+ only
         .app_wdf_cmd          (), // valid for QDRII+ only
         .compare_error        (c0_data_compare_error),

         .vio_tg_rst                           (1'b0),
         .vio_tg_start                         (1'b1),
         .vio_tg_err_chk_en                    (1'b0),
         .vio_tg_err_clear                     (1'b0),
         .vio_tg_instr_addr_mode               (4'b0),
         .vio_tg_instr_data_mode               (4'b0),
         .vio_tg_instr_rw_mode                 (4'b0),
         .vio_tg_instr_rw_submode              (2'b0),
         .vio_tg_instr_num_of_iter             (32'b0),
         .vio_tg_instr_nxt_instr               (6'b0),
         .vio_tg_status_first_err_bit          (),
         .vio_tg_restart                       (1'b0),
         .vio_tg_pause                         (1'b0),
         .vio_tg_err_clear_all                 (1'b0),
         .vio_tg_err_continue                  (1'b0),
         .vio_tg_instr_program_en              (1'b0),
         .vio_tg_direct_instr_en               (1'b0),
         .vio_tg_instr_num                     (5'b00000),
         .vio_tg_instr_victim_mode             (3'b000),
         .vio_tg_instr_victim_aggr_delay       (5'b00000),
         .vio_tg_instr_victim_select           (3'b000),
         .vio_tg_instr_m_nops_btw_n_burst_m    (10'd0),
         .vio_tg_instr_m_nops_btw_n_burst_n    (32'd0),
         .vio_tg_seed_program_en               (1'b0),
         .vio_tg_seed_num                      (8'h00),
         .vio_tg_seed                          (23'd0),
         .vio_tg_glb_victim_bit                (8'h00),
         .vio_tg_glb_start_addr                ({APP_ADDR_WIDTH{1'b0}}),
         .vio_tg_glb_qdriv_rw_submode          (2'b00),
         .vio_tg_status_state                  (vio_tg_status_state),
         .vio_tg_status_err_bit_valid          (vio_tg_status_err_bit_valid),
         .vio_tg_status_err_bit                (vio_tg_status_err_bit),
         .vio_tg_status_err_cnt                (vio_tg_status_err_cnt),
         .vio_tg_status_err_addr               (vio_tg_status_err_addr),
         .vio_tg_status_exp_bit_valid          (vio_tg_status_exp_bit_valid),
         .vio_tg_status_exp_bit                (vio_tg_status_exp_bit),
         .vio_tg_status_read_bit_valid         (vio_tg_status_read_bit_valid),
         .vio_tg_status_read_bit               (vio_tg_status_read_bit),
         .vio_tg_status_first_err_bit_valid    (vio_tg_status_first_err_bit_valid),
         .vio_tg_status_first_err_addr         (vio_tg_status_first_err_addr),
         .vio_tg_status_first_exp_bit_valid    (vio_tg_status_first_exp_bit_valid),
         .vio_tg_status_first_exp_bit          (vio_tg_status_first_exp_bit),
         .vio_tg_status_first_read_bit_valid   (vio_tg_status_first_read_bit_valid),
         .vio_tg_status_first_read_bit         (vio_tg_status_first_read_bit),
         .vio_tg_status_err_bit_sticky_valid   (vio_tg_status_err_bit_sticky_valid),
         .vio_tg_status_err_bit_sticky         (vio_tg_status_err_bit_sticky),
         .vio_tg_status_err_cnt_sticky         (vio_tg_status_err_cnt_sticky),
         .vio_tg_status_err_type_valid         (vio_tg_status_err_type_valid),
         .vio_tg_status_err_type               (vio_tg_status_err_type),
         .vio_tg_status_wr_done                (vio_tg_status_wr_done),
         .vio_tg_status_done                   (vio_tg_status_done),
         .vio_tg_status_watch_dog_hang         (vio_tg_status_watch_dog_hang),
         .tg_ila_debug                         (tg_ila_debug),
         .tg_qdriv_submode11_app_rd            (1'b0)
      
  );
  `endif





`ifdef VIO_ATG_EN

`endif

endmodule





































