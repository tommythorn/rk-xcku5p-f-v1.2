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
//  /   /         Filename           : ddr4_v2_2_19_tg_mpfifo.sv
// /___/   /\     Date Last Modified : $Date: 2014/09/03 $
// \   \  /  \    Date Created       : Thu May 22 2014
//  \___\/\___\
//
// Device           : UltraScale
// Design Name      : Traffic Generator
// Purpose:
// Multiport FIFO for TG
//
// Reference        :
// Revision History :
//*****************************************************************************

`timescale 1ps / 1ps

module ddr4_v2_2_19_tg_mpfifo
  #(
    parameter TCQ = 100,
    parameter WIDTH  = 576,
    parameter DEPTH = 4,
    parameter LOG2DEPTH  = 2,
    parameter NUM_PORT = 4,
    parameter LOG2NUM_PORT = 2
    )
(
 input 				 clk,
 input 				 rst,
 input [NUM_PORT-1:0] 		 wren,
 input [NUM_PORT-1:0] 		 rden,
 input [NUM_PORT*WIDTH-1:0] 	 din,
 output reg [NUM_PORT*WIDTH-1:0] dout,
 output reg 			 full,
 output reg 			 empty,
 output reg [LOG2DEPTH:0] 	 cnt,
 output reg [LOG2DEPTH:0] 	 space
 );

   reg [WIDTH-1:0]  data[DEPTH-1:0];
   reg [LOG2DEPTH-1:0] rdptr;
   reg [LOG2DEPTH-1:0] wrptr;   

   wire 	     write;
   wire 	     read;
   reg [LOG2DEPTH:0] cnt_nxt;
   reg [LOG2DEPTH:0] space_nxt;
   
   reg [LOG2NUM_PORT:0] wr_cnt;
   reg [LOG2NUM_PORT:0] rd_cnt;   

   reg [LOG2NUM_PORT-1:0] wr_map[NUM_PORT];
   reg [LOG2NUM_PORT-1:0] rd_map[NUM_PORT];   

   integer 		   i,j;
   
   always@(*) begin
      wr_cnt = 'h0;
      rd_cnt = 'h0;
      for (i=0; i<NUM_PORT;i=i+1) begin
	 wr_map[i] = 'h0;
	 rd_map[i] = 'h0;	 
      end
      for (i=0; i<NUM_PORT;i=i+1) begin
	 wr_cnt = wren[i] + wr_cnt;
	 rd_cnt = rden[i] + rd_cnt;
      end
      for (i=1; i<NUM_PORT;i=i+1) begin
	 wr_map[i] = wren[i-1] + wr_map[i-1];
	 rd_map[i] = rden[i-1] + rd_map[i-1];
      end
   end

   assign write = (|wren) && ~full  && (space >= wr_cnt);
   assign read  = (|rden) && ~empty && (cnt   >= rd_cnt);
   
   always@(posedge clk) begin
      if (rst) begin
	 rdptr <= #TCQ 'h0;
	 wrptr <= #TCQ 'h0;
      end
      else begin
	 if (write) begin
	    wrptr <= #TCQ wrptr + wr_cnt;
	    for (i=0; i<NUM_PORT; i=i+1) begin
	       if (wren[i]) begin
		  data[wrptr+wr_map[i]] <= #TCQ din[i*WIDTH+:WIDTH];
	       end
	    end
	 end
	 if (read) begin
	    rdptr <= #TCQ rdptr + rd_cnt;
	 end
      end

      if (rst) begin
	 cnt   <= #TCQ 'h0;
	 space <= #TCQ DEPTH;
	 full  <= #TCQ 'h0;
	 empty <= #TCQ 'h1;
      end
      else begin
	 cnt   <= #TCQ cnt_nxt;
	 space <= #TCQ space_nxt;
	 full  <= #TCQ (cnt_nxt == DEPTH);
	 empty <= #TCQ (cnt_nxt == 'h0);
      end
   end

   always@(*) begin
      casez ({write, read})
	2'b00: begin 
	   cnt_nxt   = cnt; 
	   space_nxt = space;
	end
	2'b01, 2'b10, 2'b11: begin
	   cnt_nxt   = cnt   + wr_cnt - rd_cnt;
	   space_nxt = space - wr_cnt + rd_cnt;
	end
      endcase
   end
   
   always@(*) begin
      for (i=0; i<NUM_PORT; i=i+1) begin
	 dout[i*WIDTH+:WIDTH]  = data[rdptr+rd_map[i]];
      end
   end

endmodule

