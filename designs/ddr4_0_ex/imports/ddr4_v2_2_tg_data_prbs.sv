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
//  /   /         Filename           : ddr4_v2_2_19_tg_data_prbs.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// This is PRBS generator wrapper
// PRBS block is modified from 7Series traffic generator
// PRBS 8,10,23 are supported
// PRBS seed is hard-coded
// PRSB generator generates NUM_DQ_PINS number of independent PRBS bitstreams.
// Each PRBS bitstream returns width of nCK_PER_CLK*2 per cycle
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

module ddr4_v2_2_19_tg_data_prbs 
  #(
    parameter TCQ              = 100,
    //parameter APP_DATA_WIDTH   = 576,        // RLDRAM3 data bus width.
    parameter NUM_DQ_PINS      = 72,
    parameter nCK_PER_CLK      = 4,
    parameter NUM_PORT         = 1,
    parameter PRBS_WIDTH       = 23
  )
   (
    // ********* ALL SIGNALS AT THIS INTERFACE ARE ACTIVE HIGH SIGNALS ********/
    input 				   clk, // memory controller (MC) user interface (UI) clock
    input 				   rst, // MC UI reset signal.
    input 				   prbs_en,
    input 				   prbs_load_seed,
    input [PRBS_WIDTH-1:0] 		   prbs_seed [NUM_DQ_PINS*NUM_PORT-1:0],
    output [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0] prbs_vec
    );

//*******************************************************************************
// Tmp solution for PRBS generator
//*******************************************************************************   
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_rising_0;
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_falling_0;
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_rising_1;
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_falling_1;
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_rising_2;
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_falling_2;
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_rising_3;
   wire [NUM_DQ_PINS*NUM_PORT-1:0] 		   prbsdata_falling_3 ;
   wire [2*nCK_PER_CLK-1:0] 		   prbs_out [NUM_DQ_PINS*NUM_PORT-1:0];
   wire [PRBS_WIDTH*NUM_DQ_PINS*NUM_PORT-1:0]       lfsr_reg_o;
   genvar 				   r, s;
   
/*   
   generate
      for (s = 0; s < NUM_DQ_PINS/4; s = s + 1) begin: gen_prbs_seed
	 assign prbs_seed[4*s+0] = {(PRBS_WIDTH/2){2'b10}} + ((4*s+0)<<0 + (4*s+0)<<4 + (4*s+0)<<8 + (4*s+0)<<12 + (4*s+0)<<16 + (4*s+0)<<20);
	 assign prbs_seed[4*s+1] = 23'h56bf03              + ((4*s+1)<<0 + (4*s+1)<<4 + (4*s+1)<<8 + (4*s+1)<<12 + (4*s+1)<<16 + (4*s+1)<<20);
	 assign prbs_seed[4*s+2] = 23'h671bdc              + ((4*s+2)<<0 + (4*s+2)<<4 + (4*s+2)<<8 + (4*s+2)<<12 + (4*s+2)<<16 + (4*s+2)<<20);
	 assign prbs_seed[4*s+3] = 23'h2dc0af              + ((4*s+3)<<0 + (4*s+3)<<4 + (4*s+3)<<8 + (4*s+3)<<12 + (4*s+3)<<16 + (4*s+3)<<20);
      end
   endgenerate
*/   
   generate
      for (r = 0; r < NUM_DQ_PINS*NUM_PORT; r = r + 1) begin: gen_prbs_pin
	 ddr4_v2_2_19_tg_prbs_gen #
               (.nCK_PER_CLK   (nCK_PER_CLK),
		.TCQ           (TCQ),
		.PRBS_WIDTH    (PRBS_WIDTH)
		)
	 u_ddr4_v2_2_19_data_prbs_gen
	       (
		.clk_i           (clk),
		.rst_i           (rst),
		.clk_en_i        (prbs_en),
		.prbs_load_seed  (prbs_load_seed),
		.prbs_seed       (prbs_seed[r]),
		.prbs_o          (prbs_out[r]),
		.lfsr_reg_o      (lfsr_reg_o[PRBS_WIDTH*r +: PRBS_WIDTH])
		);   
      end 
   endgenerate
   
   generate
      for (r = 0; r < NUM_DQ_PINS*NUM_PORT; r = r + 1) begin: gen_prbs_rise_fall_data
	 if (nCK_PER_CLK == 1) begin: gen_ck_per_clk1
            assign prbsdata_rising_0[r]  = prbs_out[r][1];
            assign prbsdata_falling_0[r] = prbs_out[r][0];
	 end else if (nCK_PER_CLK == 2) begin: gen_ck_per_clk2
	    // Note this is reverse order as suggested in ddr4_v2_2_19_tg_prbs_gen.sv 
            assign prbsdata_rising_0[r]  = prbs_out[r][3];
            assign prbsdata_falling_0[r] = prbs_out[r][2];
            assign prbsdata_rising_1[r]  = prbs_out[r][1];
            assign prbsdata_falling_1[r] = prbs_out[r][0];
            //assign prbsdata_rising_2[r]  = 'h0;
            //assign prbsdata_falling_2[r] = 'h0;
            //assign prbsdata_rising_3[r]  = 'h0;
            //assign prbsdata_falling_3[r] = 'h0;
	 end else if (nCK_PER_CLK == 4) begin: gen_ck_per_clk4
            assign prbsdata_rising_0[r]  = prbs_out[r][7];
            assign prbsdata_falling_0[r] = prbs_out[r][6];
            assign prbsdata_rising_1[r]  = prbs_out[r][5];
            assign prbsdata_falling_1[r] = prbs_out[r][4]; 
            assign prbsdata_rising_2[r]  = prbs_out[r][3];
            assign prbsdata_falling_2[r] = prbs_out[r][2];
            assign prbsdata_rising_3[r]  = prbs_out[r][1];
            assign prbsdata_falling_3[r] = prbs_out[r][0];
	 end
      end

      if (nCK_PER_CLK == 1) begin: gen_ck_per_clk1
	 assign prbs_vec = {prbsdata_falling_0,prbsdata_rising_0};
      end else if (nCK_PER_CLK == 2) begin: gen_ck_per_clk2
	 assign prbs_vec = {prbsdata_falling_1,prbsdata_rising_1,prbsdata_falling_0,prbsdata_rising_0};
      end else if (nCK_PER_CLK == 4) begin: gen_ck_per_clk4
	 assign prbs_vec = {prbsdata_falling_3,prbsdata_rising_3,prbsdata_falling_2,prbsdata_rising_2,prbsdata_falling_1,prbsdata_rising_1,prbsdata_falling_0,prbsdata_rising_0};
      end	    
   endgenerate
   
   //*******************************************************************************
endmodule // ddr4_v2_2_19_tg_data_prbs



