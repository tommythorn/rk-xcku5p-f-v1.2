`timescale 1ns / 1ps
`default_nettype none
module blink(
    input  wire       sys_clk_p,
    input  wire       sys_clk_n,
    input  wire [3:0] key,
    input  wire       rxd,
    output wire [3:0] led,
    output wire       txd
    );

   assign txd = rxd; // WORKS!

   wire clk;
   IBUFGDS ibufgds_inst(.I(sys_clk_p), .IB(sys_clk_n), .O(clk));

   // Blinking at 1 Hz means dividing by 25M
   reg [31:0] count = 0;
   reg        toggle = 0;

   always @(posedge clk)
     if (count == 'd 25_000_000) begin
        toggle <= !toggle;
        count <= 0;
     end else
       count <= count + 1;

   // Quick test
   assign led[0] = key[0];
   assign led[1] = 1 ^ key[1];
   assign led[2] = 0 ^ key[2];
   assign led[3] = toggle ^ key[3];
endmodule
