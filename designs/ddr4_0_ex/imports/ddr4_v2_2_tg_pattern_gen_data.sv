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
//  /   /         Filename           : ddr4_v2_2_19_tg_pattern_gen_data.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// This is data pattern generation block.
// Data patterns supported are:
// - PRBS (PRBS block is modified from 7Series traffic generator), PRBS 8,10,23 are supprted
// - Linear
// - Walking0/1
// - Hammer0/1
//
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

// Data Pattern Generation
module ddr4_v2_2_19_tg_pattern_gen_data
  #(
    parameter TCQ            = 100,    
    parameter APP_DATA_WIDTH = 288,
    parameter NUM_DQ_PINS    = 36,
    parameter nCK_PER_CLK    = 4,
    parameter NUM_PORT       = 1,
    parameter PRBS_WIDTH     = 23
    )
   (
    input 				     clk,
    input 				     rst,
    //input 			    calib_complete,
    input 				     pattern_load,
    input 				     pattern_done, 
    input [PRBS_WIDTH-1:0] 		     pattern_prbs_seed[NUM_DQ_PINS*NUM_PORT-1:0],
    input [APP_DATA_WIDTH*NUM_PORT-1:0]      pattern_linear_seed,
    input [3:0] 			     pattern_mode,
    input 		                     pattern_en,
    input 				     pattern_hold,
    output reg 				     pattern_valid,
    output reg [APP_DATA_WIDTH*NUM_PORT-1:0] pattern_out
    );

   integer 				     i, j;
   reg 					     pattern_int_valid;
   reg [APP_DATA_WIDTH*NUM_PORT-1:0] 	     pattern_int;

   localparam TG_PATTERN_MODE_LINEAR   = 4'b0000;   
   localparam TG_PATTERN_MODE_PRBS     = 4'b0001;
   localparam TG_PATTERN_MODE_WALKING1 = 4'b0010;
   localparam TG_PATTERN_MODE_WALKING0 = 4'b0011;
   localparam TG_PATTERN_MODE_HAMMER1  = 4'b0100;
   localparam TG_PATTERN_MODE_HAMMER0  = 4'b0101;
   localparam TG_PATTERN_MODE_BRAM     = 4'b0110;
   localparam TG_PATTERN_MODE_CAL_CPLX = 4'b0111;

   localparam TG_PATTERN_LOG2_NUM_BRAM_ENTRY     = 9;
   localparam TG_PATTERN_NUM_BRAM_ENTRY          = 512;
   localparam TG_PATTERN_LOG2_NUM_CAL_CPLX_ENTRY = 9;
   localparam TG_PATTERN_NUM_CAL_CPLX_ENTRY      = 156;
   
   //***********************************************   
   // PRBS engine
   wire [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0]  prbs_vec;
   ddr4_v2_2_19_tg_data_prbs 
     #(
       .TCQ(TCQ),
       //.APP_DATA_WIDTH(APP_DATA_WIDTH),
       .NUM_DQ_PINS(NUM_DQ_PINS),
       .nCK_PER_CLK(nCK_PER_CLK),
       .NUM_PORT(NUM_PORT),
       .PRBS_WIDTH(PRBS_WIDTH)
       ) ddr4_v2_2_19_u_data_prbs
       (
	.clk(clk),
	.rst(rst),
	.prbs_seed(pattern_prbs_seed),
	.prbs_load_seed(pattern_load),
	.prbs_en(pattern_en && ~pattern_hold),
	.prbs_vec(prbs_vec)
	);

   //***********************************************
   // Linear engine
   reg [NUM_DQ_PINS-1:0] 		 linear[2*nCK_PER_CLK*NUM_PORT];
   reg [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0]  linear_vec;
   always@(posedge clk) begin
      for (i=0; i<(2*nCK_PER_CLK*NUM_PORT); i=i+1) begin : gen_lbl_linear
	 if (pattern_load) begin
	    //linear[i] <= #TCQ pattern_linear_seed[NUM_DQ_PINS*i +: NUM_DQ_PINS];
	    linear_vec[NUM_DQ_PINS*i +: NUM_DQ_PINS] <= #TCQ pattern_linear_seed[NUM_DQ_PINS*i +: NUM_DQ_PINS];
	 end
	    else if (pattern_en && ~pattern_hold) begin
	       //linear[i] <= #TCQ linear[i] + 2*nCK_PER_CLK;
	       linear_vec[NUM_DQ_PINS*i +: NUM_DQ_PINS] <= #TCQ linear_vec[NUM_DQ_PINS*i +: NUM_DQ_PINS] + 2*nCK_PER_CLK*NUM_PORT;
	    end
      end
   end

   //***********************************************
   // Walking 1/0 engine
   reg [NUM_DQ_PINS-1:0] 		 walking[2*nCK_PER_CLK*NUM_PORT];
   reg [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0]  walking_vec;   
   reg 					 walking_select;

   always@(posedge clk) begin
      walking_select <= #TCQ (pattern_mode == TG_PATTERN_MODE_WALKING1);
   end
      
   always@(posedge clk) begin
      for (i=0; i<(2*nCK_PER_CLK*NUM_PORT); i=i+1) begin : gen_lbl_walking_i
	 for (j=0; j<NUM_DQ_PINS; j=j+1) begin : gen_lbl_walking_j

	       if (pattern_load) begin
		  walking[i][j] <= #TCQ (i == j);
	       end
	       else if (pattern_en && ~pattern_hold) begin
		  if (j==0) begin
		     walking[i][0] <= #TCQ walking[i][NUM_DQ_PINS-1];
//		     if (i==0) begin
//			walking[i][0] <= #TCQ walking[2*nCK_PER_CLK-1][NUM_DQ_PINS-1];
//		     end
//		     else begin
//			walking[i][0] <= #TCQ walking[i-1][NUM_DQ_PINS-1];
//		     end
		  end
		  else begin
		     walking[i][j] <= #TCQ walking[i][j-1];
		  end
	       end
	    end
	 end
   end
   always@(*) begin
      for (i=0; i<(2*nCK_PER_CLK*NUM_PORT); i=i+1) begin : gen_lbl_walking_i_2
	 walking_vec[NUM_DQ_PINS*i +: NUM_DQ_PINS] = walking_select ? walking[i] : ~walking[i];
      end
   end

   //***********************************************
   // Hammer engine
   reg [NUM_DQ_PINS-1:0] 		 hammer[2*nCK_PER_CLK*NUM_PORT];
   reg [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0] 	 hammer_vec;
   reg 					 hammer_select;

   always@(posedge clk) begin
      hammer_select <= #TCQ (pattern_mode == TG_PATTERN_MODE_HAMMER1);
   end
      
   always@(*) begin
      for (i=0; i<(2*nCK_PER_CLK*NUM_PORT); i=i+1) begin : gen_lbl_hammer
	 hammer[i] = (i%2)?{NUM_DQ_PINS{1'b0}}:{NUM_DQ_PINS{1'b1}};
	 hammer_vec[NUM_DQ_PINS*i +: NUM_DQ_PINS] = hammer_select ? hammer[i] : ~hammer[i];
      end
   end
   
   //***********************************************
   // BRAM engine
   // TBD
   wire [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0]  bram_vec;
   wire [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0]  bram_out;
   reg [TG_PATTERN_LOG2_NUM_BRAM_ENTRY-1:0] bram_ptr;

   ddr4_v2_2_19_tg_pattern_gen_data_bram
     #(
       .TCQ(TCQ),
       //.APP_DATA_WIDTH(APP_DATA_WIDTH),
       .NUM_DQ_PINS(NUM_DQ_PINS),
       .nCK_PER_CLK(nCK_PER_CLK),
       .TG_PATTERN_LOG2_NUM_BRAM_ENTRY(TG_PATTERN_LOG2_NUM_BRAM_ENTRY)
       )
   u_ddr4_v2_2_19_tg_pattern_gen_data_bram
     (
      .bram_ptr(bram_ptr),
      .bram_out(bram_out)
      );
   
   always@(posedge clk) begin
      if (pattern_load) begin
	 bram_ptr <= #TCQ {TG_PATTERN_LOG2_NUM_BRAM_ENTRY{1'b0}};
      end
      else if (pattern_en && ~pattern_hold) begin
	 if (bram_ptr < TG_PATTERN_NUM_BRAM_ENTRY) begin
	    bram_ptr <= #TCQ bram_ptr + 'b1;
	 end
	 else begin
	    bram_ptr <= #TCQ {TG_PATTERN_LOG2_NUM_BRAM_ENTRY{1'b0}};
	 end
      end
   end

   assign bram_vec = bram_out;

   //***********************************************
   // CAL CMPLX BRAM engine
   // TBD
   wire [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0]  cal_cplx_vec;
   wire [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0]  cal_cplx_out;
   reg [TG_PATTERN_LOG2_NUM_BRAM_ENTRY-1:0] cal_cplx_ptr;

   ddr4_v2_2_19_tg_pattern_gen_data_cal_cplx
     #(
       .TCQ(TCQ),
       .NUM_DQ_PINS(NUM_DQ_PINS),
       .nCK_PER_CLK(nCK_PER_CLK),
       .TG_PATTERN_LOG2_NUM_CAL_CPLX_ENTRY(TG_PATTERN_LOG2_NUM_CAL_CPLX_ENTRY)
       )
   u_ddr4_v2_2_19_tg_pattern_gen_data_cal_cplx
     (
      .cal_cplx_ptr(cal_cplx_ptr),
      .cal_cplx_out(cal_cplx_out)
      );
   
   always@(posedge clk) begin
      if (pattern_load) begin
	 cal_cplx_ptr <= #TCQ {TG_PATTERN_LOG2_NUM_CAL_CPLX_ENTRY{1'b0}};
      end
      else if (pattern_en && ~pattern_hold) begin
	 if (cal_cplx_ptr < TG_PATTERN_NUM_CAL_CPLX_ENTRY) begin
	    cal_cplx_ptr <= #TCQ cal_cplx_ptr + 'b1;
	 end
	 else begin
	    cal_cplx_ptr <= #TCQ {TG_PATTERN_LOG2_NUM_CAL_CPLX_ENTRY{1'b0}};
	 end
      end
   end

   assign cal_cplx_vec = cal_cplx_out;

   
   //***********************************************
   // output select
//   reg 	pattern_load_status;
//   always@(posedge clk) begin
//      if (rst) begin
//	 pattern_int_valid <= #TCQ 1'b0;
//      end
//      else begin
//	 pattern_int_valid <= #TCQ pattern_load ? 1'b1 : pattern_done ? 1'b0 : pattern_int_valid;
//      end
//   end
   
   always@(*) begin
      casez (pattern_mode)
	TG_PATTERN_MODE_LINEAR:     pattern_int = linear_vec;
	TG_PATTERN_MODE_PRBS:       pattern_int = prbs_vec;
	TG_PATTERN_MODE_WALKING1,
	  TG_PATTERN_MODE_WALKING0: pattern_int = walking_vec;
	TG_PATTERN_MODE_HAMMER1,
	  TG_PATTERN_MODE_HAMMER0:  pattern_int = hammer_vec;
	TG_PATTERN_MODE_BRAM:       
	  begin
	     pattern_int = bram_vec;
	     //synthesis translate_off
	     //assert (rst!=1'b0 || pattern_en!=1'b1 /*|| calib_complete!=1'b1*/) else begin $display ($time, "Warning: BRAM mode not supported for data mode\n"); end
	     //synthesis translate_on
	  end
	TG_PATTERN_MODE_CAL_CPLX:   pattern_int = cal_cplx_vec;
	default: begin
           pattern_int = 'h0;
	     //synthesis translate_off
	     //assert (rst!=1'b0 || pattern_en!=1'b1 /*|| calib_complete!=1'b1*/) else begin $display ($time, "Warning: User programmed unsupported data mode %x\n", pattern_mode); end
	     //synthesis translate_on
	end
      endcase
   end

   //synthesis translate_off
   always@(posedge clk) begin
      if (!rst && pattern_en) begin
	 assert (pattern_mode == TG_PATTERN_MODE_LINEAR    ||
		 pattern_mode == TG_PATTERN_MODE_PRBS      ||
		 pattern_mode == TG_PATTERN_MODE_WALKING0  ||
		 pattern_mode == TG_PATTERN_MODE_WALKING1  ||
		 pattern_mode == TG_PATTERN_MODE_HAMMER0  ||
		 pattern_mode == TG_PATTERN_MODE_HAMMER1  ||
		 pattern_mode == TG_PATTERN_MODE_BRAM ||
		 pattern_mode == TG_PATTERN_MODE_CAL_CPLX)
	   else begin
	      $display ($time, "Warning: User programmed unsupported data mode %x\n", pattern_mode); 
	   end	      
      end
   end
   //synthesis translate_on
   
   always@(posedge clk) begin
      if (rst | pattern_load) begin
	 pattern_valid <= #TCQ 1'b0;
      end
      else if (pattern_en && ~pattern_hold /*&& pattern_int_valid*/) begin
	 pattern_valid <= #TCQ 1'b1 /*pattern_int_valid*/;
	 pattern_out   <= #TCQ pattern_int;
      end
   end
   
endmodule // ddr4_v2_2_19_tg_pattern_gen_data


