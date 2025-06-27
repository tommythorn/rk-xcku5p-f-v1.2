//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           top_sd_rw
// Last modified Date:  2020/05/28 20:28:08
// Last Version:        V1.0
// Descriptions:        SD����д����ģ��
//                      
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2020/05/28 20:28:08
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module top_sd_rw(
    input               sys_clk_p   ,    //ϵͳʱ��
    input               sys_clk_n   ,    //ϵͳʱ��
    input               sys_rst_n   ,    //ϵͳ��λ���͵�ƽ��Ч
    
    //SD���ӿ�
    input               sd_miso     ,   //SD��SPI�������������ź�
    output              sd_clk      ,   //SD��SPIʱ���ź�
    output              sd_cs       ,   //SD��SPIƬѡ�ź�
    output              sd_mosi     ,   //SD��SPI������������ź�
   
    //LED
    output              led             //LED��
    );

//wire define
wire             clk_ref            ;
wire             clk_ref_180deg     ;
wire             rst_n              ;
wire             locked             ;
wire             wr_start_en        ;        //��ʼдSD�������ź�
wire   [31:0]    wr_sec_addr        ;        //д����������ַ    
wire   [15:0]    wr_data            ;        //д����            
wire             rd_start_en        ;        //��ʼдSD�������ź�
wire   [31:0]    rd_sec_addr        ;        //������������ַ    
wire             error_flag         ;        //SD����д����ı�־
wire             wr_busy            ;        //д����æ�ź�
wire             wr_req             ;        //д���������ź�
wire             rd_busy            ;        //��æ�ź�
wire             rd_val_en          ;        //���ݶ�ȡ��Чʹ���ź�
wire   [15:0]    rd_val_data        ;        //������
wire             sd_init_done       ;        //SD����ʼ������ź�

//*****************************************************
//**                    main code
//*****************************************************

assign  rst_n = sys_rst_n & locked;

//PLLʱ��
clk_wiz_0 u_clk_wiz_0(
    // Clock out ports
    .clk_out1       (clk_ref),     // output clk_out1
    .clk_out2       (clk_ref_180deg),     // output clk_out2
    // Status and control signals
    .reset          (1'b0), // input reset
    .locked         (locked),       // output locked
   // Clock in ports
    .clk_in1_p      (sys_clk_p),    // input clk_in1_p
    .clk_in1_n      (sys_clk_n)
);    // input clk_in1_n



//����SD����������  
data_gen u_data_gen(
    .clk                 (clk_ref),
    .rst_n               (rst_n),
    .sd_init_done        (sd_init_done),
    .wr_busy             (wr_busy),
    .wr_req              (wr_req),
    .wr_start_en         (wr_start_en),
    .wr_sec_addr         (wr_sec_addr),
    .wr_data             (wr_data),
    .rd_val_en           (rd_val_en),
    .rd_val_data         (rd_val_data),
    .rd_start_en         (rd_start_en),
    .rd_sec_addr         (rd_sec_addr),
    .error_flag          (error_flag)
    );     

//SD���������ģ��
sd_ctrl_top u_sd_ctrl_top(
    .clk_ref             (clk_ref),
    .clk_ref_180deg      (clk_ref_180deg),
    .rst_n               (rst_n),
    //SD���ӿ�
    .sd_miso             (sd_miso),
    .sd_clk              (sd_clk),
    .sd_cs               (sd_cs),
    .sd_mosi             (sd_mosi),
    //�û�дSD���ӿ�
    .wr_start_en         (wr_start_en),
    .wr_sec_addr         (wr_sec_addr),
    .wr_data             (wr_data),
    .wr_busy             (wr_busy),
    .wr_req              (wr_req),
    //�û���SD���ӿ�
    .rd_start_en         (rd_start_en),
    .rd_sec_addr         (rd_sec_addr),
    .rd_busy             (rd_busy),
    .rd_val_en           (rd_val_en),
    .rd_val_data         (rd_val_data),    
    
    .sd_init_done        (sd_init_done)
    );

//led��ʾ 
led_alarm #(
    .L_TIME      (25'd25_000_000)
    )  
   u_led_alarm(
    .clk            (clk_ref),
    .rst_n          (rst_n),
    .led            (led),
    .error_flag     (error_flag)
    ); 
    
endmodule