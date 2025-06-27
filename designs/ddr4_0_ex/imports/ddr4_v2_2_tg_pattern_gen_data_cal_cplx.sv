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
//  /   /         Filename           : ddr4_v2_2_19_tg_pattern_gen_cal_cplx.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// This is complex calibration data pattern.
//
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

// BRAM
module ddr4_v2_2_19_tg_pattern_gen_data_cal_cplx
  #(
    parameter TCQ            = 100,    
    //parameter APP_DATA_WIDTH = 288,
    parameter NUM_DQ_PINS    = 36,
    parameter nCK_PER_CLK    = 4,
    parameter NUM_PORT       = 1,
    parameter TG_PATTERN_LOG2_NUM_CAL_CPLX_ENTRY = 9
    )
   (  
      input [TG_PATTERN_LOG2_NUM_CAL_CPLX_ENTRY-1:0] 	  cal_cplx_ptr,
      output reg [NUM_DQ_PINS*2*nCK_PER_CLK*NUM_PORT-1:0] cal_cplx_out
      );

   localparam BRAM_WIDTH = 16;
   reg [BRAM_WIDTH-1:0] 				  mem_out;
   integer 						  i;
   
   always@(*) begin
      for (i=0; i<2*nCK_PER_CLK*NUM_PORT; i=i+1) begin
	 cal_cplx_out[NUM_DQ_PINS*i+:NUM_DQ_PINS] = {{(NUM_DQ_PINS-2){1'b0}},mem_out[16-1-i],mem_out[8-1-i]};
      end
   end
   
   always@(*) begin
      casez (cal_cplx_ptr>>((nCK_PER_CLK == 2) ? 1 : 0))
     //        {aggressor pattern, victim pattern}
    8'd0    :   mem_out = {8'b10101010,8'b10101010}; //1 read
    8'd1    :   mem_out = {8'b11001100,8'b11001100}; //2 reads
    8'd2    :   mem_out = {8'b11001100,8'b11001100}; //2 reads
    8'd3    :   mem_out = {8'b11100011,8'b11100011}; //3 reads
    8'd4    :   mem_out = {8'b10001110,8'b10001110}; //3 reads
    8'd5    :   mem_out = {8'b00111000,8'b00111000}; //3 reads
    8'd6    :   mem_out = {8'b11110000,8'b11110000}; //4 reads
    8'd7    :   mem_out = {8'b11110000,8'b11110000}; //4 reads
    8'd8    :   mem_out = {8'b11110000,8'b11110000}; //4 reads
    8'd9    :   mem_out = {8'b11110000,8'b11110000}; //4 reads
    8'd10   :   mem_out = {8'b11111000,8'b11111000}; //5 reads
    8'd11   :   mem_out = {8'b00111110,8'b00111110}; //5 reads
    8'd12   :   mem_out = {8'b00001111,8'b00001111}; //5 reads
    8'd13   :   mem_out = {8'b10000011,8'b10000011}; //5 reads
    8'd14   :   mem_out = {8'b11100000,8'b11100000}; //5 reads
    8'd15   :   mem_out = {8'b11111100,8'b11111100}; //6 reads
    8'd16   :   mem_out = {8'b00001111,8'b00001111}; //6 reads
    8'd17   :   mem_out = {8'b11000000,8'b11000000}; //6 reads
    8'd18   :   mem_out = {8'b11111100,8'b11111100}; //6 reads
    8'd19   :   mem_out = {8'b00001111,8'b00001111}; //6 reads
    8'd20   :   mem_out = {8'b11000000,8'b11000000}; //6 reads
     // VCCO noise injection pattern with non-matching victim (reads with gaps)
     // content format
     //        {aggressor pattern, victim pattern}
    8'd21   :   mem_out = {8'b10101010,8'b01010101}; //1 read
    8'd22   :   mem_out = {8'b11001100,8'b00110011}; //2 reads
    8'd23   :   mem_out = {8'b11001100,8'b00110011}; //2 reads
    8'd24   :   mem_out = {8'b11100011,8'b00011100}; //3 reads
    8'd25   :   mem_out = {8'b10001110,8'b01110001}; //3 reads
    8'd26   :   mem_out = {8'b00111000,8'b11000111}; //3 reads
    8'd27   :   mem_out = {8'b11110000,8'b00001111}; //4 reads
    8'd28   :   mem_out = {8'b11110000,8'b00001111}; //4 reads
    8'd29   :   mem_out = {8'b11110000,8'b00001111}; //4 reads
    8'd30   :   mem_out = {8'b11110000,8'b00001111}; //4 reads
    8'd31   :   mem_out = {8'b11111000,8'b00000111}; //5 reads
    8'd32   :   mem_out = {8'b00111110,8'b11000001}; //5 reads
    8'd33   :   mem_out = {8'b00001111,8'b11110000}; //5 reads
    8'd34   :   mem_out = {8'b10000011,8'b01111100}; //5 reads
    8'd35   :   mem_out = {8'b11100000,8'b00011111}; //5 reads
    8'd36   :   mem_out = {8'b11111100,8'b00000011}; //6 reads
    8'd37   :   mem_out = {8'b00001111,8'b11110000}; //6 reads
    8'd38   :   mem_out = {8'b11000000,8'b00111111}; //6 reads
    8'd39   :   mem_out = {8'b11111100,8'b00000011}; //6 reads
    8'd40   :   mem_out = {8'b00001111,8'b11110000}; //6 reads
    8'd41   :   mem_out = {8'b11000000,8'b00111111}; //6 reads
    // VCCAUX noise injection pattern with ISI pattern on victim (reads with gaps)
    // content format
    //        {aggressor pattern, victim pattern}
    8'd42   :   mem_out = {8'b10110100,8'b01010111}; //3 reads
    8'd43   :   mem_out = {8'b10110100,8'b01101111}; //3 reads
    8'd44   :   mem_out = {8'b10110100,8'b11000000}; //3 reads
    8'd45   :   mem_out = {8'b10100010,8'b10000100}; //4 reads
    8'd46   :   mem_out = {8'b10001010,8'b00110001}; //4 reads
    8'd47   :   mem_out = {8'b00101000,8'b01000111}; //4 reads
    8'd48   :   mem_out = {8'b10100010,8'b00100101}; //4 reads
    8'd49   :   mem_out = {8'b10101111,8'b10011010}; //5 reads
    8'd50   :   mem_out = {8'b01010000,8'b01111010}; //5 reads
    8'd51   :   mem_out = {8'b10101111,8'b10010101}; //5 reads
    8'd52   :   mem_out = {8'b01010000,8'b11011011}; //5 reads
    8'd53   :   mem_out = {8'b10101111,8'b11110000}; //5 reads
    8'd54   :   mem_out = {8'b10101000,8'b00100001}; //7 reads
    8'd55   :   mem_out = {8'b00101010,8'b10001010}; //7 reads
    8'd56   :   mem_out = {8'b00001010,8'b00100101}; //7 reads
    8'd57   :   mem_out = {8'b10000010,8'b10011010}; //7 reads
    8'd58   :   mem_out = {8'b10100000,8'b01111010}; //7 reads
    8'd59   :   mem_out = {8'b10101000,8'b10111111}; //7 reads
    8'd60   :   mem_out = {8'b00101010,8'b01010111}; //7 reads
    8'd61   :   mem_out = {8'b10101011,8'b01101111}; //8 reads
    8'd62   :   mem_out = {8'b11110101,8'b11000000}; //8 reads
    8'd63   :   mem_out = {8'b01000000,8'b10000100}; //8 reads
    8'd64   :   mem_out = {8'b10101011,8'b00110001}; //8 reads
    8'd65   :   mem_out = {8'b11110101,8'b01000111}; //8 reads
    8'd66   :   mem_out = {8'b01000000,8'b00100101}; //8 reads
    8'd67   :   mem_out = {8'b10101011,8'b10011010}; //8 reads
    8'd68   :   mem_out = {8'b11110101,8'b01111010}; //8 reads
    8'd69   :   mem_out = {8'b10101010,8'b10010101}; //9 reads
    8'd70   :   mem_out = {8'b00000010,8'b11011011}; //9 reads
    8'd71   :   mem_out = {8'b10101000,8'b11110000}; //9 reads
    8'd72   :   mem_out = {8'b00001010,8'b00100001}; //9 reads
    8'd73   :   mem_out = {8'b10100000,8'b10001010}; //9 reads
    8'd74   :   mem_out = {8'b00101010,8'b00100101}; //9 reads
    8'd75   :   mem_out = {8'b10000000,8'b10011010}; //9 reads
    8'd76   :   mem_out = {8'b10101010,8'b01111010}; //9 reads
    8'd77   :   mem_out = {8'b00000010,8'b10111111}; //9 reads
    8'd78   :   mem_out = {8'b10101010,8'b01010111}; //10 reads
    8'd79   :   mem_out = {8'b11111111,8'b01101111}; //10 reads
    8'd80   :   mem_out = {8'b01010101,8'b11000000}; //10 reads
    8'd81   :   mem_out = {8'b00000000,8'b10000100}; //10 reads
    8'd82   :   mem_out = {8'b10101010,8'b00110001}; //10 reads
    8'd83   :   mem_out = {8'b11111111,8'b01000111}; //10 reads
    8'd84   :   mem_out = {8'b01010101,8'b00100101}; //10 reads
    8'd85   :   mem_out = {8'b00000000,8'b10011010}; //10 reads
    8'd86   :   mem_out = {8'b10101010,8'b01111010}; //10 reads
    8'd87   :   mem_out = {8'b11111111,8'b10010101}; //10 reads
    8'd88   :   mem_out = {8'b10101010,8'b11011011}; //12 reads
    8'd89   :   mem_out = {8'b10000000,8'b11110000}; //12 reads
    8'd90   :   mem_out = {8'b00101010,8'b00100001}; //12 reads
    8'd91   :   mem_out = {8'b10100000,8'b10001010}; //12 reads
    8'd92   :   mem_out = {8'b00001010,8'b00100101}; //12 reads
    8'd93   :   mem_out = {8'b10101000,8'b10011010}; //12 reads
    8'd94   :   mem_out = {8'b00000010,8'b01111010}; //12 reads
    8'd95   :   mem_out = {8'b10101010,8'b10111111}; //12 reads
    8'd96   :   mem_out = {8'b00000000,8'b01010111}; //12 reads
    8'd97   :   mem_out = {8'b10101010,8'b01101111}; //12 reads
    8'd98   :   mem_out = {8'b10000000,8'b11000000}; //12 reads
    8'd99   :   mem_out = {8'b00101010,8'b10000100}; //12 reads
    8'd100  :   mem_out = {8'b10101010,8'b00110001}; //13 reads
    8'd101  :   mem_out = {8'b10111111,8'b01000111}; //13 reads
    8'd102  :   mem_out = {8'b11110101,8'b00100101}; //13 reads
    8'd103  :   mem_out = {8'b01010100,8'b10011010}; //13 reads
    8'd104  :   mem_out = {8'b00000000,8'b01111010}; //13 reads
    8'd105  :   mem_out = {8'b10101010,8'b10010101}; //13 reads
    8'd106  :   mem_out = {8'b10111111,8'b11011011}; //13 reads
    8'd107  :   mem_out = {8'b11110101,8'b11110000}; //13 reads
    8'd108  :   mem_out = {8'b01010100,8'b00100001}; //13 reads
    8'd109  :   mem_out = {8'b00000000,8'b10001010}; //13 reads
    8'd110  :   mem_out = {8'b10101010,8'b00100101}; //13 reads
    8'd111  :   mem_out = {8'b10111111,8'b10011010}; //13 reads
    8'd112  :   mem_out = {8'b11110101,8'b01111010}; //13 reads
    8'd113  :   mem_out = {8'b10101010,8'b10111111}; //14 reads
    8'd114  :   mem_out = {8'b10100000,8'b01010111}; //14 reads
    8'd115  :   mem_out = {8'b00000010,8'b01101111}; //14 reads
    8'd116  :   mem_out = {8'b10101010,8'b11000000}; //14 reads
    8'd117  :   mem_out = {8'b10000000,8'b10000100}; //14 reads
    8'd118  :   mem_out = {8'b00001010,8'b00110001}; //14 reads
    8'd119  :   mem_out = {8'b10101010,8'b01000111}; //14 reads
    8'd120  :   mem_out = {8'b00000000,8'b00100101}; //14 reads
    8'd121  :   mem_out = {8'b00101010,8'b10011010}; //14 reads
    8'd122  :   mem_out = {8'b10101000,8'b01111010}; //14 reads
    8'd123  :   mem_out = {8'b00000000,8'b10010101}; //14 reads
    8'd124  :   mem_out = {8'b10101010,8'b11011011}; //14 reads
    8'd125  :   mem_out = {8'b10100000,8'b11110000}; //14 reads
    8'd126  :   mem_out = {8'b00000010,8'b00100001}; //14 reads
    // ISI pattern (Back-to-back reads)
    // content format
    //        {aggressor pattern, victim pattern}
    8'd127  :   mem_out = {8'b01010111,8'b01010111};
    8'd128  :   mem_out = {8'b01101111,8'b01101111};
    8'd129  :   mem_out = {8'b11000000,8'b11000000};
    8'd130  :   mem_out = {8'b10000110,8'b10000100};
    8'd131  :   mem_out = {8'b00101000,8'b00110001};
    8'd132  :   mem_out = {8'b11100100,8'b01000111};
    8'd133  :   mem_out = {8'b10110011,8'b00100101};
    8'd134  :   mem_out = {8'b01001111,8'b10011011};
    8'd135  :   mem_out = {8'b10110101,8'b01010101};
    8'd136  :   mem_out = {8'b10110101,8'b01010101};
    8'd137  :   mem_out = {8'b10000111,8'b10011000};
    8'd138  :   mem_out = {8'b11100011,8'b00011100};
    8'd139  :   mem_out = {8'b00001010,8'b11110101};
    8'd140  :   mem_out = {8'b11010100,8'b00101011};
    8'd141  :   mem_out = {8'b01001000,8'b10110111};
    8'd142  :   mem_out = {8'b00011111,8'b11100000};
    8'd143  :   mem_out = {8'b10111100,8'b01000011};
    8'd144  :   mem_out = {8'b10001111,8'b00010100};
    8'd145  :   mem_out = {8'b10110100,8'b01001011};
    8'd146  :   mem_out = {8'b11001011,8'b00110100};
    8'd147  :   mem_out = {8'b00001010,8'b11110101};
    8'd148  :   mem_out = {8'b10000000,8'b00000000};
    //Additional for ISI 
    8'd149  :   mem_out = {8'b00000000,8'b00000000};
    8'd150  :   mem_out = {8'b01010101,8'b01010101};
    8'd151  :   mem_out = {8'b01010101,8'b01010101};
    8'd152  :   mem_out = {8'b00000000,8'b00000000};
    8'd153  :   mem_out = {8'b00000000,8'b00000000};
    8'd154  :   mem_out = {8'b01010101,8'b00101010};
    8'd155  :   mem_out = {8'b01010101,8'b10101010};
    8'd156  :   mem_out = {8'b00000000,8'b10000000};
	default: mem_out = {8'b00000000,8'b00000000};
      endcase	
   end   
endmodule


