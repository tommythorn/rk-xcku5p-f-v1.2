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
//  /   /         Filename           : ddr4_v2_2_19_tg_top.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// Simple FIFO for TG timing fix
//
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

module ddr4_v2_2_19_tg_fifo
  #(
    parameter TCQ = 100,
    parameter WIDTH  = 576,
    parameter DEPTH = 4,
    parameter LOG2DEPTH  = 2
    )
(
 input 		    clk,
 input 		    rst,
 input 		    wren,
 input 		    rden,
 input [WIDTH-1:0]  din,
 output [WIDTH-1:0] dout,
 output reg 	    full,
 output reg 	    empty
 );

   reg [WIDTH-1:0]  data[DEPTH-1:0];
   reg [LOG2DEPTH-1:0] rdptr;
   reg [LOG2DEPTH-1:0] wrptr;   
   reg [LOG2DEPTH:0] cnt;

   wire 	     write;
   wire 	     read;
   reg [LOG2DEPTH:0] cnt_nxt;
   
   assign write = wren && ~full;
   assign read  = rden && ~empty;
   
   always@(posedge clk) begin
      if (rst) begin
	 rdptr <= #TCQ 'h0;
	 wrptr <= #TCQ 'h0;
      end
      else begin
	 if (write) begin
	    wrptr       <= #TCQ wrptr + 'h1;
	    data[wrptr[LOG2DEPTH-1:0]] <= #TCQ din;
	 end
	 if (read) begin
	    rdptr <= #TCQ rdptr + 'h1;
	 end
      end

      if (rst) begin
	 cnt   <= #TCQ 'h0;
	 full  <= #TCQ 'h0;
	 empty <= #TCQ 'h1;
      end
      else begin
	 cnt   <= #TCQ cnt_nxt;
	 full  <= #TCQ (cnt_nxt == DEPTH);
	 empty <= #TCQ (cnt_nxt == 'h0);
      end
   end

   always@(*) begin
      casez ({write, read})
	2'b00: cnt_nxt = cnt;
	2'b01: cnt_nxt = cnt-'h1;
	2'b10: cnt_nxt = cnt+'h1;
	2'b11: cnt_nxt = cnt;	
      endcase
   end
   
   assign dout  = data[rdptr[LOG2DEPTH-1:0]];
//   assign full  = (rdptr[LOG2DEPTH] != wrptr[LOG2DEPTH]) && 
//		    (rdptr[LOG2DEPTH-1:0] == wrptr[LOG2DEPTH-1:0]);
//   assign empty = (rdptr == wrptr);

endmodule

