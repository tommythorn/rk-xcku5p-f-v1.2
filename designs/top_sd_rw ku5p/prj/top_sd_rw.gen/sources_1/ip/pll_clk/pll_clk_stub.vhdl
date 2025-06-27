-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Wed Oct 18 14:33:35 2023
-- Host        : DESKTOP-ND6K090 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {e:/Document/FPGA/Davinci
--               pro/A100T/top_sd_rw/prj/top_sd_rw.gen/sources_1/ip/pll_clk/pll_clk_stub.vhdl}
-- Design      : pll_clk
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pll_clk is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end pll_clk;

architecture stub of pll_clk is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,reset,locked,clk_in1";
begin
end;
