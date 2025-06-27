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
//  /   /         Filename           : ddr4_v2_2_19_tg_pattern_gen_data_bram.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// This is BRAM data pattern.
//
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

// BRAM
module ddr4_v2_2_19_tg_pattern_gen_data_bram
  #(
    parameter TCQ            = 100,    
    //parameter APP_DATA_WIDTH = 288,
    parameter NUM_DQ_PINS    = 36,
    parameter nCK_PER_CLK    = 4,
    parameter NUM_PORT       = 1,
    parameter TG_PATTERN_LOG2_NUM_BRAM_ENTRY = 9
    )
   (  
      input [TG_PATTERN_LOG2_NUM_BRAM_ENTRY-1:0] bram_ptr,
      output reg [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0] 	 bram_out
      );
   
   always@(*) begin
     casez (bram_ptr)
       'd0: bram_out = 'h123;
       'd1: bram_out = 'h456;
       'd2: bram_out = 'h789;
       'd3: bram_out = 'h0ab;
       default: bram_out = 'h0;
     endcase // casez (bram_ptr)
   end

   // Step
//   always@(*) begin
//     if (bram_ptr < 9'd256)
//       bram_out = {(NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT){1'b0}};
//     else
//       bram_out = {(NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT){1'b1}};
//   end
   
endmodule


