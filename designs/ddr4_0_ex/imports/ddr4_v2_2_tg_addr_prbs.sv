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
//  /   /         Filename           : ddr4_v2_2_19_tg_addr_prbs.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// This is PRBS generator wrapper
// PRBS 8 to 34 are supported
// PRSB generator generates N-entries of consecutive PRBS pattern per cycle
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

module ddr4_v2_2_19_tg_addr_prbs 
  #(
    //--------------------------------------------		
    // Configuration parameters
    //--------------------------------------------		
    parameter TCQ = 100,
    parameter PRBS_WIDTH = 23,
    parameter NUM_OF_POLY_TAP = 2,
    parameter POLY_TAP0 = 18,
    parameter POLY_TAP1 = 23,
    parameter POLY_TAP2 = 18,
    parameter POLY_TAP3 = 23,
    parameter N_ENTRY = 8
    )		      
   (
   //--------------------------------------------		
   // Input/Outputs
   //--------------------------------------------		
   input 		     rst,
   input 		     clk,
   input 		     prbs_load_seed,
   input [PRBS_WIDTH:1]      prbs_seed,
   input 		     prbs_en,
   output reg 		     prbs_repeat,
   output reg [PRBS_WIDTH:1] prbs_out [N_ENTRY]
    );
   
  //--------------------------------------------		
  // Internal variables
   //--------------------------------------------		
   reg [PRBS_WIDTH:1] 	     prbs[N_ENTRY+1];
   reg [N_ENTRY-1:0] 	     prbs_xor_a;
   reg [N_ENTRY:1] 	     prbs_lsb;
   reg [PRBS_WIDTH:1] 	     prbs_reg;
   reg [N_ENTRY-1:0] 	     prbs_repeat_int;
   reg  		     prbs_repeat_cnt;
   integer 		     i;
  //--------------------------------------------		
  // Implementation
  //--------------------------------------------		
   always@(*) begin
      for (i=0; i<N_ENTRY; i=i+1) begin : g1
	 if (NUM_OF_POLY_TAP == 2) begin
	    prbs_xor_a[i] = prbs[i][POLY_TAP0] ^ prbs[i][POLY_TAP1];
	 end
	 else if (NUM_OF_POLY_TAP == 3) begin
	    prbs_xor_a[i] = prbs[i][POLY_TAP0] ^ prbs[i][POLY_TAP1] ^
			    prbs[i][POLY_TAP2];
	 end
	 else begin
	    prbs_xor_a[i] = prbs[i][POLY_TAP0] ^ prbs[i][POLY_TAP1] ^
			    prbs[i][POLY_TAP2] ^ prbs[i][POLY_TAP3];
	 end
	 prbs_lsb[i+1] = prbs_xor_a[i];
	 prbs[i+1] = {prbs[i][PRBS_WIDTH-1:1], prbs_lsb[i+1]};
	 prbs_repeat_int[i] = (prbs[i] == prbs_seed);
      end
   end
   
   always @(posedge clk) begin
      if(prbs_load_seed) begin
         prbs_reg <= #TCQ prbs_seed;
	 prbs_repeat_cnt <= #TCQ 1'b0;
	 prbs_repeat <= #TCQ 1'b0;
      end
      else if(prbs_en) begin
         prbs_reg <= #TCQ prbs[N_ENTRY];
	 prbs_repeat_cnt <= #TCQ (|prbs_repeat_int);
	 prbs_repeat <= #TCQ prbs_repeat | ((|prbs_repeat_int) && (prbs_repeat_cnt > 1'b0)) ;
      end
  end

   always@(*) begin
      prbs[0] = prbs_reg;
   end

   always@(*) begin
      for(i=0;i<N_ENTRY;i=i+1) begin
	 prbs_out[i] = prbs[i];
      end
   end
   
//   assign prbs[0] = prbs_reg;
//   assign prbs_out[N_ENTRY-1:0] = prbs[N_ENTRY-1:0];
   
endmodule

