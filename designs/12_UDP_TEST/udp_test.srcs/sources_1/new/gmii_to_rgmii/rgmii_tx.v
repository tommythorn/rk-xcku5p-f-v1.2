//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           rgmii_tx
// Last modified Date:  2020/2/13 9:20:14
// Last Version:        V1.0
// Descriptions:        RGMII发送模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2020/2/13 9:20:14
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module rgmii_tx(
    //GMII发送端口
    input              gmii_tx_clk , //GMII发送时钟    
    input              gmii_tx_en  , //GMII输出数据有效信号
    input       [7:0]  gmii_txd    , //GMII输出数据        
    
    //RGMII发送端口
    output             rgmii_txc   , //RGMII发送数据时钟    
    output             rgmii_tx_ctl, //RGMII输出数据有效信号
    output      [3:0]  rgmii_txd     //RGMII输出数据     
    );

//*****************************************************
//**                    main code
//*****************************************************

assign rgmii_txc = gmii_tx_clk;

//输出双沿采样寄存器 (rgmii_tx_ctl)
ODDRE1 #(
      .IS_C_INVERTED     (1'b0),            // Optional inversion for C
      .IS_D1_INVERTED    (1'b0),            // Unsupported, do not use
      .IS_D2_INVERTED    (1'b0),            // Unsupported, do not use
      .SIM_DEVICE        ("ULTRASCALE"),    // Set the device version (ULTRASCALE, ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,ULTRASCALE_PLUS_ES2)
      .SRVAL(1'b0)                          // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
   )
   ODDRE1_tx_ctl (
      .Q     (rgmii_tx_ctl),    // 1-bit output: Data output to IOB
      .C     (gmii_tx_clk),     // 1-bit input: High-speed clock input
      .D1    (gmii_tx_en),      // 1-bit input: Parallel data input 1
      .D2    (gmii_tx_en),      // 1-bit input: Parallel data input 2
      .SR    (1'b0)             // 1-bit input: Active High Async Reset
   );

genvar i;
generate for (i=0; i<4; i=i+1)
    begin : txdata_bus
      ODDRE1 #(
      .IS_C_INVERTED(1'b0),      // Optional inversion for C
      .IS_D1_INVERTED(1'b0),     // Unsupported, do not use
      .IS_D2_INVERTED(1'b0),     // Unsupported, do not use
      .SIM_DEVICE("ULTRASCALE"), // Set the device version (ULTRASCALE, ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,ULTRASCALE_PLUS_ES2)
      .SRVAL(1'b0)               // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
   )
   ODDRE1_inst (
      .Q     (rgmii_txd[i]),      // 1-bit output: Data output to IOB
      .C     (gmii_tx_clk),       // 1-bit input: High-speed clock input
      .D1    (gmii_txd[i]),       // 1-bit input: Parallel data input 1
      .D2    (gmii_txd[4+i]),     // 1-bit input: Parallel data input 2
      .SR    (1'b0)               // 1-bit input: Active High Async Reset
   );             
    end
endgenerate

endmodule