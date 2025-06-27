//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           rgmii_tx
// Last modified Date:  2020/2/13 9:20:14
// Last Version:        V1.0
// Descriptions:        RGMII����ģ��
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2020/2/13 9:20:14
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module rgmii_tx(
    //GMII���Ͷ˿�
    input              gmii_tx_clk , //GMII����ʱ��    
    input              gmii_tx_en  , //GMII���������Ч�ź�
    input       [7:0]  gmii_txd    , //GMII�������        
    
    //RGMII���Ͷ˿�
    output             rgmii_txc   , //RGMII��������ʱ��    
    output             rgmii_tx_ctl, //RGMII���������Ч�ź�
    output      [3:0]  rgmii_txd     //RGMII�������     
    );

//*****************************************************
//**                    main code
//*****************************************************

assign rgmii_txc = gmii_tx_clk;

//���˫�ز����Ĵ��� (rgmii_tx_ctl)
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