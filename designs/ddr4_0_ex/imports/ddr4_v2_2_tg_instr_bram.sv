/******************************************************************************
// (c) Copyright 2013 Xilinx, Inc. All rights reserved.
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
// \   \   \/     Version            : 1.1
//  \   \         Application        : MIG
//  /   /         Filename           : ddr4_v2_2_19_tg_instr_bram.sv
// /___/   /\     Date Last Modified : $Date$
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// This is traffic table instruction BRAM.
//
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

// BRAM
module ddr4_v2_2_19_tg_instr_bram
  #(
    parameter MEM_TYPE       = "DDR3",
    parameter SIMULATION     = "FALSE",
    parameter TCQ            = 100,    
    parameter TG_INSTR_TBL_DEPTH = 32,
    parameter TG_INSTR_PTR_WIDTH = 6,
    parameter TG_MEM_W1_W0_ADDR_SPACE = 6,
    parameter TG_INSTR_NUM_OF_ITER_WIDTH = 32,
    parameter [TG_INSTR_NUM_OF_ITER_WIDTH-1:0] TG_MAX_NUM_OF_ITER_ADDR = 1024,
    parameter DEFAULT_MODE   = 0
    )
   (  
      input [1:0] 			  tg_glb_qdriv_rw_submode,
      output reg [3:0] 			  bram_instr_addr_mode[TG_INSTR_TBL_DEPTH-1:0],
      output reg [3:0] 			  bram_instr_data_mode[TG_INSTR_TBL_DEPTH-1:0],
      output reg [3:0] 			  bram_instr_rw_mode[TG_INSTR_TBL_DEPTH-1:0],
      output reg [1:0] 			  bram_instr_rw_submode[TG_INSTR_TBL_DEPTH-1:0],
      output reg [2:0] 			  bram_instr_victim_mode[TG_INSTR_TBL_DEPTH-1:0],
      output reg [4:0] 			  bram_instr_victim_aggr_delay[TG_INSTR_TBL_DEPTH-1:0],
      output reg [2:0] 			  bram_instr_victim_select[TG_INSTR_TBL_DEPTH-1:0],
      output reg [TG_INSTR_NUM_OF_ITER_WIDTH-1:0] 		  bram_instr_num_of_iter[TG_INSTR_TBL_DEPTH-1:0],
      output reg [9:0] 			  bram_instr_m_nops_btw_n_burst_m[TG_INSTR_TBL_DEPTH-1:0],
      output reg [31:0] 		  bram_instr_m_nops_btw_n_burst_n[TG_INSTR_TBL_DEPTH-1:0],
      output reg [TG_INSTR_PTR_WIDTH-1:0] bram_instr_nxt_instr[TG_INSTR_TBL_DEPTH-1:0]
      );
   // QDRIV Read/Write submode
   // SUBMODE under DATA_MODE
   localparam TG_RW_SUBMODE_QDRIV_PORTX_RW        = 2'b00; // PortA and PortB Write then Read
   localparam TG_RW_SUBMODE_QDRIV_PORTA_W_PORTB_R = 2'b01; // PortA Write and PortB Read
   localparam TG_RW_SUBMODE_QDRIV_PORTB_W_PORTA_R = 2'b10; // PortA Write and PortB Read
   localparam TG_RW_SUBMODE_QDRIV_PORTAB_RW       = 2'b11; // PortA and PortB with Mixed Read/Write

   // DDR3/4 Read/Write submode
   localparam TG_RW_SUBMODE_DDR_W_R               = 2'b00; // Write follows by Read
   localparam TG_RW_SUBMODE_DDR_W_R_SIMU          = 2'b01; // Write and Read in parallel

   localparam TG_RW_SUBMODE_DEFAULT               = 2'b00; // For QDR/RLD, this is default value
   
   wire [4+4+4+2+3+3+5+TG_INSTR_NUM_OF_ITER_WIDTH+10+32+TG_INSTR_PTR_WIDTH-1:0] bram_out[TG_INSTR_TBL_DEPTH-1:0];
   wire [TG_INSTR_NUM_OF_ITER_WIDTH-1:0] 					tg_max_num_of_iter_addr;
   integer 					 i;
   
   assign tg_max_num_of_iter_addr = (MEM_TYPE == "QDRIV" && 
				     tg_glb_qdriv_rw_submode == TG_RW_SUBMODE_QDRIV_PORTX_RW) ? 
				    TG_MAX_NUM_OF_ITER_ADDR/2 :
				    TG_MAX_NUM_OF_ITER_ADDR;
   
   localparam TG_INSTR_NUM_EXIT     = 6'b111111;

   localparam TG_PATTERN_MODE_LINEAR   = 4'b0000;   
   localparam TG_PATTERN_MODE_PRBS     = 4'b0001;
   localparam TG_PATTERN_MODE_WALKING1 = 4'b0010;
   localparam TG_PATTERN_MODE_WALKING0 = 4'b0011;
   localparam TG_PATTERN_MODE_HAMMER1  = 4'b0100;
   localparam TG_PATTERN_MODE_HAMMER0  = 4'b0101;
   localparam TG_PATTERN_MODE_BRAM     = 4'b0110;
   localparam TG_PATTERN_MODE_CAL_CPLX = 4'b0111;
	
   localparam TG_RW_MODE_READ_ONLY  = 4'b0000;
   localparam TG_RW_MODE_WRITE_ONLY = 4'b0001;
   localparam TG_RW_MODE_WRITE_READ = 4'b0010;
   localparam TG_RW_MODE_WRITE_ONCE_READ_FOREVER = 4'b0011;
   localparam TG_RW_MODE_READ_ONLY_W_CHECK= 4'b0100;
   
   localparam TG_VICTIM_MODE_NO_VICTIM     = 3'b000;
   localparam TG_VICTIM_MODE_HELD1         = 3'b001;
   localparam TG_VICTIM_MODE_HELD0         = 3'b010;   
   localparam TG_VICTIM_MODE_NONINV_AGGR   = 3'b011;
   localparam TG_VICTIM_MODE_INV_AGGR      = 3'b100;
   localparam TG_VICTIM_MODE_DELAYED_AGGR  = 3'b101;
   localparam TG_VICTIM_MODE_DELAYED_VICTIM = 3'b110;
   localparam TG_VICTIM_MODE_CAL_CPLX       = 3'b111;
   
   localparam TG_VICTIM_SELECT_EXTERNAL = 3'b000;
   localparam TG_VICTIM_SELECT_ROTATE4  = 3'b001;
   localparam TG_VICTIM_SELECT_ROTATE8  = 3'b010;
   localparam TG_VICTIM_SELECT_ROTATE_ALL = 3'b011;
   
   always@(*) begin   
      for (i=0; i<TG_INSTR_TBL_DEPTH; i=i+1) begin: bram_instr_init
	 bram_instr_addr_mode[i]            = bram_out[i][4+4+2+3+3+5+32+10+32+TG_INSTR_PTR_WIDTH +: 4];
	 bram_instr_data_mode[i]            = bram_out[i][  4+2+3+3+5+32+10+32+TG_INSTR_PTR_WIDTH +: 4];
	 bram_instr_rw_mode[i]              = bram_out[i][    2+3+3+5+32+10+32+TG_INSTR_PTR_WIDTH +: 4];
	 bram_instr_rw_submode[i]           = bram_out[i][      3+3+5+32+10+32+TG_INSTR_PTR_WIDTH +: 2];
	 bram_instr_victim_mode[i]          = bram_out[i][        3+5+32+10+32+TG_INSTR_PTR_WIDTH +: 3];
	 bram_instr_victim_select[i]        = bram_out[i][          5+32+10+32+TG_INSTR_PTR_WIDTH +: 3];
	 bram_instr_victim_aggr_delay[i]    = bram_out[i][            32+10+32+TG_INSTR_PTR_WIDTH +: 5];
	 bram_instr_num_of_iter[i]          = bram_out[i][               10+32+TG_INSTR_PTR_WIDTH +: TG_INSTR_NUM_OF_ITER_WIDTH];
	 bram_instr_m_nops_btw_n_burst_m[i] = bram_out[i][                  32+TG_INSTR_PTR_WIDTH +: 10];
	 bram_instr_m_nops_btw_n_burst_n[i] = bram_out[i][                     TG_INSTR_PTR_WIDTH +: 32];
	 bram_instr_nxt_instr[i]            = bram_out[i][0                                       +: TG_INSTR_PTR_WIDTH];
      end
   end

   //                     +--------------------------+--------------------------+-----------------------+----------------------------+--------------------------+--------------------------+---------+-----------------------------------+-----------+-----------+------------+
   //                     | Traffic Pattern Instruction Table																   														  
   //                     | PLEASE PROGRAM ME																		   																  
   //                     +--------------------------+--------------------------+-----------------------+----------------------------+--------------------------+--------------------------+---------+-----------------------------------+-----------+-----------+------------+
   //                     |                          |                          |                       |                            |                          |                          |         |                                   | Burst     | Burst     |            |
   //                     | Address Pattern          | Data Pattern             | Read/Write Mode       | Read/Write Submode         | Victim Mode              | Victim Select            | Victim  | Num of Iteration                  | NOP CountM| OP CountN | Next Instr |       
   //                     |                          |                          |                       |                            |                          |                          | Aggr    |                                   |           |           |            |
   //                     |                          |                          |                       |                            |                          |                          | Delay   |                                   |           |           |            |
   //                     +--------------------------+--------------------------+-----------------------+----------------------------+--------------------------+--------------------------+---------+-----------------------------------+-----------+-----------+------------+
if (SIMULATION == "FALSE") begin															   				   	  			   

if (DEFAULT_MODE == "USER0") begin  // User defined traffic. Change to program different traffic pattern
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd0};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "2015_1" || DEFAULT_MODE == 0 || MEM_TYPE == "QDRIIP" || MEM_TYPE == "QDRIV") begin // PRBS Data, HAMMER0 Data
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd0};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "2015_2" || DEFAULT_MODE == "2015_3" || DEFAULT_MODE == 1) begin // PRBS Data, HAMMER0 Data, PRBS Address
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_PRBS,      TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd0};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "WRITE_READ_RATIO") begin // PRBS Data, HAMMER0 Data, PRBS Address
   assign bram_out[0 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_WRITE_READ,         TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_READ_ONLY_W_CHECK,  TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_READ_ONLY_W_CHECK,  TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd0};
   assign bram_out[3 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_READ_ONLY_W_CHECK,  TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "HW_REGRESSION") begin // PRBS Data, HAMMER0 Data, PRBS Address, Simultaneous Write/Read
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DDR_W_R_SIMU,  TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr/2,          10'd0,      32'd1024,   6'd3};
   assign bram_out[3 ] = {TG_PATTERN_MODE_PRBS,      TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DDR_W_R_SIMU,  TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr/2,          10'd0,      32'd1024,   6'd0};
end else if (DEFAULT_MODE == "CAL_CPLX") begin // PRBS Data, HAMMER0 Data, ComplexCalibration data
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_CAL_CPLX,  TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_CAL_CPLX,   TG_VICTIM_SELECT_ROTATE8,  5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd3};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   6'd0};
end else if (DEFAULT_MODE == "SIPI") begin // PRBS Data, HAMMER0 Data, SIPI TG data
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_DELAYED_VICTIM, TG_VICTIM_SELECT_ROTATE8, 5'd0,  tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd3};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_DELAYED_VICTIM, TG_VICTIM_SELECT_ROTATE8, 5'd5,  tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd0};
end else if (DEFAULT_MODE == "SAVE_RESTORE") begin // PRBS Data, HAMMER0 Data, SIPI TG data
   assign bram_out[0 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   6'd3};
   assign bram_out[3 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   6'd0};
end else begin
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     tg_max_num_of_iter_addr,            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1024,                           10'd0,      32'd1024,   6'd0};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end
   
end else begin	// SIMULATION == TRUE   

if (DEFAULT_MODE == "USER0") begin // User defined traffic. Change to program different traffic pattern
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "2015_1" || DEFAULT_MODE == 0 || MEM_TYPE == "QDRIIP" || MEM_TYPE == "QDRIV") begin // PRBS Data, HAMMER0 Data
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "2015_2" || DEFAULT_MODE == "2015_3" || DEFAULT_MODE == 1) begin // PRBS Data, HAMMER0 Data, PRBS Address
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_PRBS,      TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "WRITE_READ_RATIO") begin // PRBS Data, PRBS Address
   assign bram_out[0 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_WRITE_READ,         TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_READ_ONLY_W_CHECK,  TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_READ_ONLY_W_CHECK,  TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,   TG_RW_MODE_READ_ONLY_W_CHECK,  TG_RW_SUBMODE_DEFAULT, TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "HW_REGRESSION") begin // PRBS Data, HAMMER0 Data, PRBS Address, Simultaneous Write/Read
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DDR_W_R_SIMU,  TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd3};
   assign bram_out[3 ] = {TG_PATTERN_MODE_PRBS,      TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DDR_W_R_SIMU,  TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "CAL_CPLX") begin // PRBS Data, HAMMER0 Data, ComplexCalibration data
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd256,                            10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd256,                            10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_CAL_CPLX,  TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_CAL_CPLX,   TG_VICTIM_SELECT_ROTATE8,  5'd0,     32'd256,                            10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "SIPI") begin // PRBS Data, HAMMER0 Data, SIPI TG data
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_DELAYED_VICTIM, TG_VICTIM_SELECT_ROTATE8, 5'd0,  32'd256,                            10'd0,      32'd1024,   6'd3};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_DELAYED_VICTIM, TG_VICTIM_SELECT_ROTATE8, 5'd5,  32'd256,                            10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else if (DEFAULT_MODE == "SAVE_RESTORE") begin // PRBS Data, HAMMER0 Data, SIPI TG data
   assign bram_out[0 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   6'd2};
   assign bram_out[2 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_PRBS,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_ONCE_READ_FOREVER,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,  tg_max_num_of_iter_addr,    10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end else begin
   assign bram_out[0 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   6'd1};
   assign bram_out[1 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_HAMMER0,   TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     32'd1000,                           10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[2 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[3 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
end   
end
   
   // Default programming (change to program different traffic pattern)										   				   	   	  	
   assign bram_out[4 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[5 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[6 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[7 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[8 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[9 ] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[10] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[11] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[12] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[13] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[14] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[15] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[16] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[17] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[18] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[19] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[20] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[21] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[22] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[23] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[24] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[25] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[26] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[27] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[28] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[29] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[30] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   assign bram_out[31] = {TG_PATTERN_MODE_LINEAR,    TG_PATTERN_MODE_PRBS,      TG_RW_MODE_WRITE_READ,  TG_RW_SUBMODE_DEFAULT,       TG_VICTIM_MODE_NO_VICTIM,  TG_VICTIM_SELECT_EXTERNAL, 5'd0,     {TG_INSTR_NUM_OF_ITER_WIDTH{1'b1}}, 10'd0,      32'd1024,   TG_INSTR_NUM_EXIT};
   //                     +--------------------------+--------------------------+-----------------------+----------------------------+--------------------------+--------------------------+---------+-----------------------------------+-----------+-----------+------------+
   
endmodule


