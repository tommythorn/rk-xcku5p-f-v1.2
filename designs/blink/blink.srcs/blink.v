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

   wire clk_200_MHz;
   IBUFGDS ibufgds_inst(.I(sys_clk_p), .IB(sys_clk_n), .O(clk_200_MHz));

   // Blinking at 1 Hz means dividing by 25M
   reg [31:0] count = 0;
   reg        toggle = 0;

   always @(posedge clk_200_MHz)
     if (count == 'd 200_000_000) begin
        toggle <= !toggle;
        count <= 0;
     end else
       count <= count + 1;

   // Quick test
   assign led[0] = key[0];
   assign led[1] = 1 ^ key[1];
   assign led[2] = 0 ^ key[2];
   assign led[3] = toggle ^ key[3];


   wire        tx_ready_o;
   wire        tx_valid_i;
   wire [7:0]  tx_data_i;

   wire        rx_ready_i;
   wire        rx_valid_o;
   wire [7:0]  rx_data_o;
   wire        rx_overflow_o;

   assign tx_valid_i = rx_valid_o;
   assign tx_data_i = rx_data_o ^ 1;
   assign rx_ready_i = tx_ready_o;

   // On macOS, only speeds up to B230400 are defined in termios.h
   // Curiously macOS/FTDI works at 460800, but higher rates do not.
   rs232tx #(200000000,115200) rs232tx_inst
     (clk_200_MHz, tx_data_i, tx_valid_i, tx_ready_o, txd);

   rs232rx #(200000000,115200) rs232rx_inst
     (clk_200_MHz, rx_data_o, rx_valid_o, rx_ready_i, rxd, rx_overflow_o);
endmodule
