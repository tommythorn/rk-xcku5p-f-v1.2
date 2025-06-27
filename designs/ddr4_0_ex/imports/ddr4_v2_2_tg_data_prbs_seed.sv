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
//  /   /         Filename           : ddr4_v2_2_19_tg_data_prbs_seed.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// These are default PRBS seed per data bit.
// PRBS 8, 10, 23 are supported.
// 23-bit seeds are presented in this file. 
// For 8-bit PRBS,  only the lower 8-bit  are used as seed.
// For 10-bit PRBS, only the lower 10-bit are used as seed.
// User could update PRBS default seed in this file OR use PRBS seed through VIO interface in ddr4_v2_2_19_hw_tg.sv
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

module ddr4_v2_2_19_tg_data_prbs_seed
  #(
    parameter TG_PATTERN_MODE_PRBS_DATA_WIDTH = 23
    )
   (
   output [TG_PATTERN_MODE_PRBS_DATA_WIDTH-1:0] 	    default_data_prbs_seed[144-1:0]
    );
    
  assign default_data_prbs_seed[0] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}};
  assign default_data_prbs_seed[1] = 23'h56bf03;
  assign default_data_prbs_seed[2] = 23'h671bdc;
  assign default_data_prbs_seed[3] = 23'h2dc0af;
  assign default_data_prbs_seed[4] = 23'h57acac;
  assign default_data_prbs_seed[5] = 23'h368b1c;
  assign default_data_prbs_seed[6] = 23'h4fc2e9;
  assign default_data_prbs_seed[7] = 23'h44ee71;
//
  assign default_data_prbs_seed[8] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h111111;
  assign default_data_prbs_seed[9] = 23'h56bf03+23'h111111;
  assign default_data_prbs_seed[10] = 23'h671bdc+23'h111111;
  assign default_data_prbs_seed[11] = 23'h2dc0af+23'h111111;
  assign default_data_prbs_seed[12] = 23'h57acac+23'h111111;
  assign default_data_prbs_seed[13] = 23'h368b1c+23'h111111;
  assign default_data_prbs_seed[14] = 23'h4fc2e9+23'h111111;
  assign default_data_prbs_seed[15] = 23'h44ee71+23'h111111;   
//
  assign default_data_prbs_seed[16] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h222222;
  assign default_data_prbs_seed[17] = 23'h56bf03+23'h222222;
  assign default_data_prbs_seed[18] = 23'h671bdc+23'h222222;
  assign default_data_prbs_seed[19] = 23'h2dc0af+23'h222222;
  assign default_data_prbs_seed[20] = 23'h57acac+23'h222222;
  assign default_data_prbs_seed[21] = 23'h368b1c+23'h222222;
  assign default_data_prbs_seed[22] = 23'h4fc2e9+23'h222222;
  assign default_data_prbs_seed[23] = 23'h44ee71+23'h222222;   
//
  assign default_data_prbs_seed[24] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h333333;
  assign default_data_prbs_seed[25] = 23'h56bf03+23'h333333;
  assign default_data_prbs_seed[26] = 23'h671bdc+23'h333333;
  assign default_data_prbs_seed[27] = 23'h2dc0af+23'h333333;
  assign default_data_prbs_seed[28] = 23'h57acac+23'h333333;
  assign default_data_prbs_seed[29] = 23'h368b1c+23'h333333;
  assign default_data_prbs_seed[30] = 23'h4fc2e9+23'h333333;
  assign default_data_prbs_seed[31] = 23'h44ee71+23'h333333;   
//
  assign default_data_prbs_seed[32] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h444444;
  assign default_data_prbs_seed[33] = 23'h56bf03+23'h444444;
  assign default_data_prbs_seed[34] = 23'h671bdc+23'h444444;
  assign default_data_prbs_seed[35] = 23'h2dc0af+23'h444444;
  assign default_data_prbs_seed[36] = 23'h57acac+23'h444444;
  assign default_data_prbs_seed[37] = 23'h368b1c+23'h444444;
  assign default_data_prbs_seed[38] = 23'h4fc2e9+23'h444444;
  assign default_data_prbs_seed[39] = 23'h44ee71+23'h444444;   

  assign default_data_prbs_seed[40] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h505050;
  assign default_data_prbs_seed[41] = 23'h56bf03+23'h555555;
  assign default_data_prbs_seed[42] = 23'h671bdc+23'h555555;
  assign default_data_prbs_seed[43] = 23'h2dc0af+23'h555555;
  assign default_data_prbs_seed[44] = 23'h57acac+23'h555555;
  assign default_data_prbs_seed[45] = 23'h368b1c+23'h555555;
  assign default_data_prbs_seed[46] = 23'h4fc2e9+23'h555555;
  assign default_data_prbs_seed[47] = 23'h44ee71+23'h555555;
//
  assign default_data_prbs_seed[48] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h666666;
  assign default_data_prbs_seed[49] = 23'h56bf03+23'h666666;
  assign default_data_prbs_seed[50] = 23'h671bdc+23'h666666;
  assign default_data_prbs_seed[51] = 23'h2dc0af+23'h666666;
  assign default_data_prbs_seed[52] = 23'h57acac+23'h666666;
  assign default_data_prbs_seed[53] = 23'h368b1c+23'h666666;
  assign default_data_prbs_seed[54] = 23'h4fc2e9+23'h666666;
  assign default_data_prbs_seed[55] = 23'h44ee71+23'h666666;   
//
  assign default_data_prbs_seed[56] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h777777;
  assign default_data_prbs_seed[57] = 23'h56bf03+23'h777777;
  assign default_data_prbs_seed[58] = 23'h671bdc+23'h777777;
  assign default_data_prbs_seed[59] = 23'h2dc0af+23'h777777;
  assign default_data_prbs_seed[60] = 23'h57acac+23'h777777;
  assign default_data_prbs_seed[61] = 23'h368b1c+23'h777777;
  assign default_data_prbs_seed[62] = 23'h4fc2e9+23'h777777;
  assign default_data_prbs_seed[63] = 23'h44ee71+23'h777777;   
//
  assign default_data_prbs_seed[64] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h088888;
  assign default_data_prbs_seed[65] = 23'h56bf03+23'h088888;
  assign default_data_prbs_seed[66] = 23'h671bdc+23'h088888;
  assign default_data_prbs_seed[67] = 23'h2dc0af+23'h088888;
  assign default_data_prbs_seed[68] = 23'h57acac+23'h088888;
  assign default_data_prbs_seed[69] = 23'h368b1c+23'h088888;
  assign default_data_prbs_seed[70] = 23'h4fc2e9+23'h088888;
  assign default_data_prbs_seed[71] = 23'h44ee71+23'h088888;   
//
  assign default_data_prbs_seed[72] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h199999;
  assign default_data_prbs_seed[73] = 23'h56bf03+23'h199999;
  assign default_data_prbs_seed[74] = 23'h671bdc+23'h199999;
  assign default_data_prbs_seed[75] = 23'h2dc0af+23'h199999;
  assign default_data_prbs_seed[76] = 23'h57acac+23'h199999;
  assign default_data_prbs_seed[77] = 23'h368b1c+23'h199999;
  assign default_data_prbs_seed[78] = 23'h4fc2e9+23'h199999;
  assign default_data_prbs_seed[79] = 23'h44ee71+23'h199999;   
//
  assign default_data_prbs_seed[80] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h2aaaaa;
  assign default_data_prbs_seed[81] = 23'h56bf03+23'h2aaaaa;
  assign default_data_prbs_seed[82] = 23'h671bdc+23'h2aaaaa;
  assign default_data_prbs_seed[83] = 23'h2dc0af+23'h2aaaaa;
  assign default_data_prbs_seed[84] = 23'h57acac+23'h2aaaaa;
  assign default_data_prbs_seed[85] = 23'h368b1c+23'h2aaaaa;
  assign default_data_prbs_seed[86] = 23'h4fc2e9+23'h2aaaaa;
  assign default_data_prbs_seed[87] = 23'h44ee71+23'h2aaaaa;
//
  assign default_data_prbs_seed[88] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h3bbbbb;
  assign default_data_prbs_seed[89] = 23'h56bf03+23'h3bbbbb;
  assign default_data_prbs_seed[90] = 23'h671bdc+23'h3bbbbb;
  assign default_data_prbs_seed[91] = 23'h2dc0af+23'h3bbbbb;
  assign default_data_prbs_seed[92] = 23'h57acac+23'h3bbbbb;
  assign default_data_prbs_seed[93] = 23'h368b1c+23'h3bbbbb;
  assign default_data_prbs_seed[94] = 23'h4fc2e9+23'h3bbbbb;
  assign default_data_prbs_seed[95] = 23'h44ee71+23'h3bbbbb;   
//
  assign default_data_prbs_seed[96] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h4ccccc;
  assign default_data_prbs_seed[97] = 23'h56bf03+23'h4ccccc;
  assign default_data_prbs_seed[98] = 23'h671bdc+23'h4ccccc;
  assign default_data_prbs_seed[99] = 23'h2dc0af+23'h4ccccc;
  assign default_data_prbs_seed[100] = 23'h57acac+23'h4ccccc;
  assign default_data_prbs_seed[101] = 23'h368b1c+23'h4ccccc;
  assign default_data_prbs_seed[102] = 23'h4fc2e9+23'h4ccccc;
  assign default_data_prbs_seed[103] = 23'h44ee71+23'h4ccccc;   
//
  assign default_data_prbs_seed[104] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h5ddddd;
  assign default_data_prbs_seed[105] = 23'h56bf03+23'h5ddddd;
  assign default_data_prbs_seed[106] = 23'h671bdc+23'h5ddddd;
  assign default_data_prbs_seed[107] = 23'h2dc0af+23'h5ddddd;
  assign default_data_prbs_seed[108] = 23'h57acac+23'h5ddddd;
  assign default_data_prbs_seed[109] = 23'h368b1c+23'h5ddddd;
  assign default_data_prbs_seed[110] = 23'h4fc2e9+23'h5ddddd;
  assign default_data_prbs_seed[111] = 23'h44ee71+23'h5ddddd;   
//
  assign default_data_prbs_seed[112] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h6eeeee;
  assign default_data_prbs_seed[113] = 23'h56bf03+23'h6eeeee;
  assign default_data_prbs_seed[114] = 23'h671bdc+23'h6eeeee;
  assign default_data_prbs_seed[115] = 23'h2dc0af+23'h6eeeee;
  assign default_data_prbs_seed[116] = 23'h57acac+23'h6eeeee;
  assign default_data_prbs_seed[117] = 23'h368b1c+23'h6eeeee;
  assign default_data_prbs_seed[118] = 23'h4fc2e9+23'h6eeeee;
  assign default_data_prbs_seed[119] = 23'h44ee71+23'h6eeeee;   
//
  assign default_data_prbs_seed[120] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h7fffff;
  assign default_data_prbs_seed[121] = 23'h56bf03+23'h7fffff;
  assign default_data_prbs_seed[122] = 23'h671bdc+23'h7fffff;
  assign default_data_prbs_seed[123] = 23'h2dc0af+23'h7fffff;
  assign default_data_prbs_seed[124] = 23'h57acac+23'h7fffff;
  assign default_data_prbs_seed[125] = 23'h368b1c+23'h7fffff;
  assign default_data_prbs_seed[126] = 23'h4fc2e9+23'h7fffff;
  assign default_data_prbs_seed[127] = 23'h44ee71+23'h7fffff;
//
  assign default_data_prbs_seed[128] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h010101;
  assign default_data_prbs_seed[129] = 23'h56bf03+23'h010101;
  assign default_data_prbs_seed[130] = 23'h671bdc+23'h010101;
  assign default_data_prbs_seed[131] = 23'h2dc0af+23'h010101;
  assign default_data_prbs_seed[132] = 23'h57acac+23'h010101;
  assign default_data_prbs_seed[133] = 23'h368b1c+23'h010101;
  assign default_data_prbs_seed[134] = 23'h4fc2e9+23'h010101;
  assign default_data_prbs_seed[135] = 23'h44ee71+23'h010101;   

  assign default_data_prbs_seed[136] = {(TG_PATTERN_MODE_PRBS_DATA_WIDTH/2){2'b10}}+23'h101010;
  assign default_data_prbs_seed[137] = 23'h56bf03+23'h101010;
  assign default_data_prbs_seed[138] = 23'h671bdc+23'h101010;
  assign default_data_prbs_seed[139] = 23'h2dc0af+23'h101010;
  assign default_data_prbs_seed[140] = 23'h57acac+23'h101010;
  assign default_data_prbs_seed[141] = 23'h368b1c+23'h101010;
  assign default_data_prbs_seed[142] = 23'h4fc2e9+23'h101010;
  assign default_data_prbs_seed[143] = 23'h44ee71+23'h101010;   

endmodule // ddr4_v2_2_19_tg_data_prbs_seed

