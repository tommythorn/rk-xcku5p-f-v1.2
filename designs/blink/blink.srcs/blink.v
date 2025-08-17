`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 07/17/2025 08:51:58 PM
// Design Name:
// Module Name: blink
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module blink(
//  input  wire       pl_clk50,
    input  wire       sys_clk_p,
    input  wire       sys_clk_n,
    input  wire [3:0] key,
    input  wire       rxd,
    output wire [3:0] led,
    output wire       txd
    );

   assign txd = rxd; // WORKS!

   // Blinking at 1 Hz means dividing by 25M
   reg [31:0] count = 0;
   reg        toggle = 0;

//   always @(posedge pl_clk50)
   always @(posedge sys_clk_p)
     if (count == 'd 25_000_000) begin
        toggle <= !toggle;
        count <= 0;
     end else
       count <= count + 1;

   // Quick first test
   assign led[0] = key[0];
   assign led[1] = 1 ^ key[1];
   assign led[2] = 0 ^ key[2];
   assign led[3] = toggle ^ key[3];
endmodule
