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
//  /   /         Filename           : ddr4_v2_2_19_tg_errchk.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/04 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// This is test generator error check block
// - In Traffic generator, all traffic pattern in Read/Write mode of
//   "Write-Read-mode" or "Write-once-Read-forever" has error check.
// - Error checker checks all Read data and compare against expected data
// - If error check (vio_tg_err_chk_en) is enabled,
//      test generator will stop upon first mismatch.
//      read check will be performed to determine if "Read" or "Write" error happened
//      error bit, read data, expected read data are logged and available in VIO interface
//   else
//      test generator continue with error
// - Error checker also log accumulated error bit all time.
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

// Data Pattern Generation
module ddr4_v2_2_19_tg_errchk
  #(
    parameter TCQ            = 100,    
    parameter APP_DATA_WIDTH = 576,
    parameter APP_ADDR_WIDTH = 28,
    parameter NUM_DQ_PINS    = 72,
    parameter nCK_PER_CLK    = 4,
    parameter CMD_PER_CLK    = 2,
    parameter MEM_TYPE       = "DDR3",
    parameter TG_INSTR_NUM_OF_ITER_WIDTH = 32
    )
   (
    input 				   clk,
    input 				   rst,
    input 				   vio_tg_err_chk_en, // Error check enable (not used in this hierarchy)
    input 				   instr_err_clear, // Clear Error - clear all error status except sticky bits
    input 				   instr_err_clear_all, // Clear Error - clear all error status
    input 				   tg_curr_read_check_en, // If read only, error check will be disabled
    input [1:0] 			   tg_glb_qdriv_rw_submode,
    //input [TG_INSTR_SM_WIDTH-1:0] 	   tg_instr_sm_ps, // Current test generator state
    input 				   tg_instr_exe_s,
    input 				   tg_instr_pausewait_s, 
    input 				   tg_instr_rwwait_s,
    input 				   tg_instr_ldwait_s,
    input 				   tg_instr_dnwait_s,
    input 				   tg_instr_errwait_s,
    input 				   tg_instr_errchk_s,
    input 				   tg_instr_load_s, 
    input 				   tg_instr_rwload_s,
    input [CMD_PER_CLK-1:0] 		   mem_read_data_valid, // Read data from memory
    input [APP_DATA_WIDTH-1:0] 		   mem_read_data,
    input [TG_INSTR_NUM_OF_ITER_WIDTH-1:0] exp_num_of_iter, // Number of Read command sent so far
    input [CMD_PER_CLK-1:0] 		   exp_read_addr_valid, // Expected read address
    input [APP_ADDR_WIDTH/CMD_PER_CLK-1:0] exp_read_addr[CMD_PER_CLK],
    input [CMD_PER_CLK-1:0] 		   exp_read_data_valid, // Expected read data
    input [APP_DATA_WIDTH-1:0] 		   exp_read_data,
    output reg 				   tg_errchk_found, // Error found
    output reg 				   tg_errchk_done, // Error check done
    output reg 				   vio_tg_status_err_bit_valid, // immediate error bit and address
    output reg [APP_DATA_WIDTH-1:0] 	   vio_tg_status_err_bit,
    output reg [31:0]                      vio_tg_status_err_cnt, // immediate error count
    output reg [APP_ADDR_WIDTH-1:0] 	   vio_tg_status_err_addr,
    output reg 				   vio_tg_status_exp_bit_valid, // immediate expected bit
    output reg [APP_DATA_WIDTH-1:0] 	   vio_tg_status_exp_bit,
    output reg 				   vio_tg_status_read_bit_valid, // immediate read data bit
    output reg [APP_DATA_WIDTH-1:0] 	   vio_tg_status_read_bit,
    output reg 				   vio_tg_status_first_err_bit_valid, // first logged error bit and address
    output reg [APP_DATA_WIDTH-1:0] 	   vio_tg_status_first_err_bit,
    output reg [APP_ADDR_WIDTH-1:0] 	   vio_tg_status_first_err_addr,
    output reg 				   vio_tg_status_first_exp_bit_valid, // first logged error, expected data and address
    output reg [APP_DATA_WIDTH-1:0] 	   vio_tg_status_first_exp_bit,
    output reg 				   vio_tg_status_first_read_bit_valid, // first logged error, read data and address
    output reg [APP_DATA_WIDTH-1:0] 	   vio_tg_status_first_read_bit,
    output reg 				   vio_tg_status_err_bit_sticky_valid, // accumulated error bit
    output reg [APP_DATA_WIDTH-1:0] 	   vio_tg_status_err_bit_sticky,
    output reg [31:0]                      vio_tg_status_err_cnt_sticky, // accumulated error count
    input 				   tg_read_test_valid, // test generator notices tg_errchk that read command is sent
    output 				   tg_read_test_en, // tg_errchk notices test generator that read command could be sent
    output reg 				   tg_read_test_done, // tg_errchk notice test generator that read test is done
    output [APP_ADDR_WIDTH-1:0] 	   tg_read_test_addr, // failed address that read test is performed
    output reg 				   vio_tg_status_err_type_valid, // Type of error, either "Read" or "Write" error
    output reg 				   vio_tg_status_err_type
    );

   localparam TG_LOG2_NUM_OF_RW_ERRCHK = 10;   
   localparam TG_NUM_OF_RW_ERRCHK = 2**TG_LOG2_NUM_OF_RW_ERRCHK;

   localparam TG_ERR_TYPE_WRITE = 1'b0;
   localparam TG_ERR_TYPE_READ  = 1'b1;

   // breakdown compare logic for timing improvement
   localparam TG_TIMING_DIV0 = (MEM_TYPE == "DDR4" || MEM_TYPE == "DDR3") ? 4 : 1;
   
   reg [TG_INSTR_NUM_OF_ITER_WIDTH-1:0]    tg_num_of_read;
   wire 				   tg_status_err_bit_valid_r2;
   wire 				   tg_errchk_valid_r;
   reg 					   tg_errchk_valid_r2;   
   reg 					   tg_errchk_valid_r3;
   wire [APP_DATA_WIDTH-1:0] 		   tg_status_err_bit_r;
   reg [APP_DATA_WIDTH-1:0] 		   tg_status_err_bit_r2;   
   reg [2*nCK_PER_CLK*CMD_PER_CLK*TG_TIMING_DIV0-1:0] 	   tg_status_err_bit_xor_r2;
   reg 					   tg_status_err_type_valid;
   reg 					   tg_status_err_type_valid_r;   
   
   //wire 				   tg_errchk_en;
   integer 				   i;

   reg 					   mem_read_data_valid_r;
   reg 					   exp_read_data_valid_r;
   reg 					   exp_read_addr_valid_r;
   reg 					   mem_read_data_valid_r2;
   reg 					   exp_read_data_valid_r2;
   reg 					   exp_read_addr_valid_r2;
   reg 					   same_read_data_xor_valid_r3;
   
   reg [APP_DATA_WIDTH-1:0] 		   mem_read_data_r;
   reg [APP_DATA_WIDTH-1:0] 		   exp_read_data_r;
   reg [APP_ADDR_WIDTH/CMD_PER_CLK-1:0]    exp_read_addr_r[CMD_PER_CLK];
   reg [APP_DATA_WIDTH-1:0] 		   mem_read_data_r2;
   reg [APP_DATA_WIDTH-1:0] 		   exp_read_data_r2;
   reg [APP_ADDR_WIDTH/CMD_PER_CLK-1:0]    exp_read_addr_r2[CMD_PER_CLK];
   
   reg [APP_DATA_WIDTH-1:0] 		   mem_read_data_masked;
   reg [APP_DATA_WIDTH-1:0] 		   exp_read_data_masked;
   

   always @(*) begin
      for(i=0; i<CMD_PER_CLK; i=i+1) begin
	 mem_read_data_masked[i*APP_DATA_WIDTH/CMD_PER_CLK+:APP_DATA_WIDTH/CMD_PER_CLK]
	= mem_read_data_valid[i] ?  mem_read_data[i*APP_DATA_WIDTH/CMD_PER_CLK+:APP_DATA_WIDTH/CMD_PER_CLK] : 
	    {APP_DATA_WIDTH/CMD_PER_CLK{1'b0}};
	 exp_read_data_masked[i*APP_DATA_WIDTH/CMD_PER_CLK+:APP_DATA_WIDTH/CMD_PER_CLK]
	= exp_read_data_valid[i] ?  exp_read_data[i*APP_DATA_WIDTH/CMD_PER_CLK+:APP_DATA_WIDTH/CMD_PER_CLK] : 
	    {APP_DATA_WIDTH/CMD_PER_CLK{1'b0}};
      end
   end
   
   always @(posedge clk) begin
      if (rst | instr_err_clear | instr_err_clear_all) begin
	 mem_read_data_valid_r      <= #TCQ 1'b0;
	 exp_read_data_valid_r      <= #TCQ 1'b0;
	 exp_read_addr_valid_r      <= #TCQ 1'b0; 
	 mem_read_data_valid_r2     <= #TCQ 1'b0;
	 exp_read_data_valid_r2     <= #TCQ 1'b0;
	 exp_read_addr_valid_r2     <= #TCQ 1'b0; 
	 same_read_data_xor_valid_r3<= #TCQ 1'b0;
	 tg_errchk_valid_r2         <= #TCQ 1'b0;
	 tg_errchk_valid_r3         <= #TCQ 1'b0;
	 tg_errchk_found            <= #TCQ 1'b0;
	 tg_errchk_done             <= #TCQ 1'b0;
      end
      else begin
	 mem_read_data_valid_r      <= #TCQ |mem_read_data_valid;
	 exp_read_data_valid_r      <= #TCQ |exp_read_data_valid;
	 exp_read_addr_valid_r      <= #TCQ |exp_read_addr_valid;
	 mem_read_data_valid_r2     <= #TCQ mem_read_data_valid_r;
	 exp_read_data_valid_r2     <= #TCQ exp_read_data_valid_r;
	 exp_read_addr_valid_r2     <= #TCQ exp_read_addr_valid_r;
	 same_read_data_xor_valid_r3<= #TCQ mem_read_data_valid_r2;
	 mem_read_data_r            <= #TCQ mem_read_data_masked;
	 exp_read_data_r            <= #TCQ exp_read_data_masked;      
	 exp_read_addr_r            <= #TCQ exp_read_addr;
	 mem_read_data_r2           <= #TCQ mem_read_data_r;
	 exp_read_data_r2           <= #TCQ exp_read_data_r;      
	 exp_read_addr_r2           <= #TCQ exp_read_addr_r;
	 tg_status_err_bit_r2       <= #TCQ tg_status_err_bit_r;
	 tg_errchk_valid_r2         <= #TCQ tg_errchk_valid_r;	 
	 tg_errchk_valid_r3         <= #TCQ tg_errchk_valid_r2;
	 tg_errchk_found            <= #TCQ tg_errchk_valid_r2 && tg_status_err_bit_valid_r2;	 
	 tg_errchk_done             <= #TCQ (tg_num_of_read == exp_num_of_iter);   // All error check traffic done
      end
   end
      
   assign tg_errchk_valid_r       = mem_read_data_valid_r && exp_read_data_valid_r &&
				    ((tg_instr_exe_s || 
				      tg_instr_pausewait_s ||
				      tg_instr_rwwait_s ||
				      tg_instr_ldwait_s ||
				      tg_instr_dnwait_s ||			      
				      tg_instr_errwait_s));
   assign tg_status_err_bit_r     = mem_read_data_r^exp_read_data_r;
 
   always@(posedge clk) begin  
      for (i=0; i<2*nCK_PER_CLK*CMD_PER_CLK*TG_TIMING_DIV0; i=i+1) begin
	 tg_status_err_bit_xor_r2[i] <= #TCQ |tg_status_err_bit_r[i*NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0 +: NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0];
      end
   end

   assign tg_status_err_bit_valid_r2 = tg_curr_read_check_en && tg_errchk_valid_r2 && (|tg_status_err_bit_xor_r2);
      
   always @(posedge clk) begin
      if (rst) begin
	 vio_tg_status_err_bit_valid        <= #TCQ 1'b0;
	 vio_tg_status_err_bit              <= #TCQ 'h0;
	 vio_tg_status_err_cnt              <= #TCQ 'h0;
      end
      else if (instr_err_clear_all | instr_err_clear) begin
	 vio_tg_status_err_bit_valid        <= #TCQ 1'b0;
	 vio_tg_status_err_bit              <= #TCQ 'h0;
	 vio_tg_status_err_cnt              <= #TCQ 'h0;
      end
      else begin
	 vio_tg_status_err_bit_valid        <= #TCQ tg_errchk_valid_r2 && tg_status_err_bit_valid_r2;
	 vio_tg_status_err_bit              <= #TCQ tg_status_err_bit_r2;
	 vio_tg_status_err_cnt              <= #TCQ ((tg_errchk_valid_r2 && tg_status_err_bit_valid_r2) && ~(&vio_tg_status_err_cnt)) ? 
					            vio_tg_status_err_cnt + 'h1 :
					            vio_tg_status_err_cnt;
      end
   end
	 
   always @(posedge clk) begin
      if (rst | instr_err_clear_all | instr_err_clear) begin
	 vio_tg_status_first_err_bit_valid  <= #TCQ 1'b0;
	 vio_tg_status_first_err_bit        <= #TCQ 'h0;
	 vio_tg_status_first_exp_bit_valid  <= #TCQ 1'b0;
	 vio_tg_status_first_exp_bit        <= #TCQ 'h0;
	 vio_tg_status_first_read_bit_valid <= #TCQ 1'b0;
	 vio_tg_status_first_read_bit       <= #TCQ 'h0;
      end
      else if (tg_errchk_valid_r2) begin
	 if (~vio_tg_status_first_err_bit_valid) begin
	    vio_tg_status_first_err_bit_valid  <= #TCQ tg_status_err_bit_valid_r2;
	    vio_tg_status_first_err_bit        <= #TCQ tg_status_err_bit_r2;
	    vio_tg_status_first_exp_bit_valid  <= #TCQ exp_read_data_valid_r2 && tg_status_err_bit_valid_r2;
	    vio_tg_status_first_exp_bit        <= #TCQ exp_read_data_r2;
	    vio_tg_status_first_read_bit_valid <= #TCQ mem_read_data_valid_r2 && tg_status_err_bit_valid_r2;
	    vio_tg_status_first_read_bit       <= #TCQ mem_read_data_r2;
	 end
      end

      if (rst | instr_err_clear_all) begin
	 vio_tg_status_err_bit_sticky_valid <= #TCQ 1'b0;
	 vio_tg_status_err_bit_sticky       <= #TCQ 'h0;
	 vio_tg_status_err_cnt_sticky       <= #TCQ 'h0;
      end
      else if (tg_errchk_valid_r3) begin
	 if (vio_tg_status_err_bit_valid) begin
	    vio_tg_status_err_bit_sticky_valid <= #TCQ vio_tg_status_err_bit_sticky_valid | vio_tg_status_err_bit_valid;
	    vio_tg_status_err_bit_sticky       <= #TCQ vio_tg_status_err_bit_sticky       | vio_tg_status_err_bit;	    
	    vio_tg_status_err_cnt_sticky       <= #TCQ ~(& vio_tg_status_err_cnt_sticky) ? 
					               vio_tg_status_err_cnt_sticky + 'h1 :
					               vio_tg_status_err_cnt_sticky;
	 end
      end

      if (rst) begin
	 tg_num_of_read                     <= #TCQ 'h0;
      end
      else if (tg_instr_load_s || tg_instr_rwload_s) begin
	 tg_num_of_read                     <= #TCQ 'h0;   
      end
      else if (tg_errchk_valid_r2) begin
	 tg_num_of_read                     <= #TCQ tg_num_of_read + 'h1;
      end
   end
   
   always @(posedge clk) begin   
      if (rst | instr_err_clear | instr_err_clear_all) begin
	 vio_tg_status_exp_bit_valid        <= #TCQ 1'h0;
	 vio_tg_status_read_bit_valid       <= #TCQ 1'h0;
      end
      else begin
	 vio_tg_status_exp_bit_valid        <= #TCQ exp_read_data_valid_r2;
	 vio_tg_status_exp_bit              <= #TCQ exp_read_data_r2;
	 vio_tg_status_read_bit_valid       <= #TCQ mem_read_data_valid_r2;
	 vio_tg_status_read_bit             <= #TCQ mem_read_data_r2;
      end
   end

   always @(posedge clk) begin   
      for (i=0; i<CMD_PER_CLK; i=i+1) begin : gen_lbl_tg_errchk
	 if (rst | instr_err_clear | instr_err_clear_all) begin
	    vio_tg_status_err_addr             <= #TCQ 'h0;
	    vio_tg_status_first_err_addr       <= #TCQ 'h0;
	 end
	 else if (tg_errchk_valid_r2) begin
	    vio_tg_status_err_addr[(APP_ADDR_WIDTH/CMD_PER_CLK)*i +: (APP_ADDR_WIDTH/CMD_PER_CLK)]  <= #TCQ exp_read_addr_r2[i];
	    if (~vio_tg_status_first_err_bit_valid) begin
	       vio_tg_status_first_err_addr[(APP_ADDR_WIDTH/CMD_PER_CLK)*i +: (APP_ADDR_WIDTH/CMD_PER_CLK)]  <= #TCQ exp_read_addr_r2[i];
	    end	       
	 end
      end
   end

   // Memory Failure categorization
   // - Perform N-reads at failed address location
   // - If all reads are the same and mismatch with expected value, it is write error.
   //   Else it is read error.
   reg [TG_LOG2_NUM_OF_RW_ERRCHK:0] tg_read_test_req_cnt;
   reg [TG_LOG2_NUM_OF_RW_ERRCHK:0] tg_read_test_ret_cnt;
   reg 				    tg_read_test_compare_equal;

   always@(posedge clk) begin
      if (rst | instr_err_clear | instr_err_clear_all) begin
	 tg_read_test_req_cnt <= #TCQ 'h0;
      end
      else if (tg_read_test_valid) begin
	 tg_read_test_req_cnt <= #TCQ tg_read_test_req_cnt + 'h1;
      end
   end

   always@(posedge clk) begin
      if (rst | instr_err_clear | instr_err_clear_all) begin
	 tg_read_test_ret_cnt <= #TCQ 'h0;
      end
      else if (mem_read_data_valid_r && tg_instr_errchk_s) begin
	 tg_read_test_ret_cnt <= #TCQ tg_read_test_ret_cnt + 'h1;
      end
   end
   
   assign tg_read_test_en   = (tg_read_test_req_cnt < TG_NUM_OF_RW_ERRCHK);
   assign tg_read_test_addr = vio_tg_status_first_err_addr;
   
   reg 			    last_read_data_valid;
   reg [APP_DATA_WIDTH-1:0] last_read_data;
   reg                      same_read_data;
   reg [2*nCK_PER_CLK*CMD_PER_CLK*TG_TIMING_DIV0-1:0] same_read_data_xor;
   reg [2*nCK_PER_CLK*CMD_PER_CLK*TG_TIMING_DIV0-1:0] last_read_data_xor;
   
   always@(posedge clk) begin
      if (rst | instr_err_clear | instr_err_clear_all) begin   
	 tg_read_test_done            <= #TCQ 'h0;
	 tg_read_test_compare_equal   <= #TCQ 'h0;
      end
      else begin
	 tg_read_test_done            <= #TCQ (tg_read_test_req_cnt == TG_NUM_OF_RW_ERRCHK) && (tg_read_test_req_cnt == tg_read_test_ret_cnt);
	 tg_read_test_compare_equal   <= #TCQ ~(|last_read_data_xor);
      end
   end
   
   always@(posedge clk) begin
      if (rst | instr_err_clear | instr_err_clear_all) begin
	 same_read_data         <= #TCQ 'h1;
      end
      else if (tg_instr_errchk_s && same_read_data_xor_valid_r3) begin
	 if (|same_read_data_xor) begin
	    same_read_data      <= #TCQ 'h0;
	 end	 
      end

      if (rst | instr_err_clear | instr_err_clear_all) begin
	 last_read_data_valid         <= #TCQ 'h0;
      end
      else if (tg_instr_errchk_s && mem_read_data_valid_r) begin
	 if (~last_read_data_valid) begin
	    last_read_data_valid <= #TCQ 'h1;
	    last_read_data       <= #TCQ mem_read_data_r;
	 end
      end      
   end
   
   always@(posedge clk) begin
      if (rst | instr_err_clear | instr_err_clear_all) begin
	 vio_tg_status_err_type_valid <= #TCQ 'h0;
    	 tg_status_err_type_valid     <= #TCQ 'h0;
    	 tg_status_err_type_valid_r   <= #TCQ 'h0;
	 vio_tg_status_err_type       <= #TCQ TG_ERR_TYPE_WRITE;
      end
      else if (tg_read_test_done) begin
    	 tg_status_err_type_valid     <= #TCQ 'h1;
    	 tg_status_err_type_valid_r   <= #TCQ tg_status_err_type_valid;
	 vio_tg_status_err_type_valid <= #TCQ tg_status_err_type_valid_r;
	 if (same_read_data && ~tg_read_test_compare_equal) begin
	    vio_tg_status_err_type <= #TCQ TG_ERR_TYPE_WRITE;
	 end
	 else begin
	    vio_tg_status_err_type <= #TCQ TG_ERR_TYPE_READ;
	 end
      end
   end

   always@(posedge clk) begin
      for (i=0; i<2*nCK_PER_CLK*CMD_PER_CLK*TG_TIMING_DIV0; i=i+1) begin
	 same_read_data_xor[i] <= #TCQ |(last_read_data[i*NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0 +: NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0]^mem_read_data_r2[i*NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0 +: NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0]);
	 last_read_data_xor[i] <= #TCQ |(last_read_data[i*NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0 +: NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0]^vio_tg_status_first_exp_bit[i*NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0 +: NUM_DQ_PINS/CMD_PER_CLK/TG_TIMING_DIV0]);
      end
   end
   
endmodule


