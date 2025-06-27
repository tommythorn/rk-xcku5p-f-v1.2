//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           data_gen
// Last modified Date:  2020/05/28 20:28:08
// Last Version:        V1.0
// Descriptions:        ����SD����������ģ��
//                      
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2020/05/28 20:28:08
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module data_gen(
    input               clk           ,  //ʱ���ź�
    input               rst_n         ,  //��λ�ź�,�͵�ƽ��Ч
    input               sd_init_done  ,  //SD����ʼ������ź�
    //дSD���ӿ�
    input               wr_busy       ,  //д����æ�ź�
    input               wr_req        ,  //д���������ź�
    output  reg         wr_start_en   ,  //��ʼдSD�������ź�
    output  reg [31:0]  wr_sec_addr   ,  //д����������ַ
    output      [15:0]  wr_data       ,  //д����
    //��SD���ӿ�
    input               rd_val_en     ,  //��������Ч�ź�
    input       [15:0]  rd_val_data   ,  //������
    output  reg         rd_start_en   ,  //��ʼдSD�������ź�
    output  reg [31:0]  rd_sec_addr   ,  //������������ַ
    
    output              error_flag       //SD����д����ı�־
    );

//reg define
reg              sd_init_done_d0  ;       //sd_init_done�ź���ʱ����
reg              sd_init_done_d1  ;       
reg              wr_busy_d0       ;       //wr_busy�ź���ʱ����
reg              wr_busy_d1       ;
reg    [15:0]    wr_data_t        ;    
reg    [15:0]    rd_comp_data     ;       //���ڶԶ����������Ƚϵ���ȷ����
reg    [8:0]      rd_right_cnt    ;       //������ȷ���ݵĸ���

//wire define
wire             pos_init_done    ;       //sd_init_done�źŵ�������,��������д���ź�
wire             neg_wr_busy      ;       //wr_busy�źŵ��½���,�����ж�����д�����

//*****************************************************
//**                    main code
//*****************************************************

assign  pos_init_done = (~sd_init_done_d1) & sd_init_done_d0;
assign  neg_wr_busy = wr_busy_d1 & (~wr_busy_d0);
//wr_data_t�仯��Χ0~256;wr_data��Χ:0~255
assign  wr_data = (wr_data_t > 16'd0)  ?  (wr_data_t - 1'b1) : 16'd0;
//��256����ȷ������,˵����д���Գɹ�,error_flag = 0
assign  error_flag = (rd_right_cnt == (9'd256))  ?  1'b0 : 1'b1;

//sd_init_done�ź���ʱ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        sd_init_done_d0 <= 1'b0;
        sd_init_done_d1 <= 1'b0;
    end
    else begin
        sd_init_done_d0 <= sd_init_done;
        sd_init_done_d1 <= sd_init_done_d0;
    end        
end

//SD��д���źſ���
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        wr_start_en <= 1'b0;
        wr_sec_addr <= 32'd0;
    end    
    else begin
        if(pos_init_done) begin
            wr_start_en <= 1'b1;
            wr_sec_addr <= 32'd2000;         //����ָ��һ��������ַ
        end    
        else
            wr_start_en <= 1'b0;
    end    
end 

//SD��д����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        wr_data_t <= 16'b0;
    else if(wr_req) 
        wr_data_t <= wr_data_t + 16'b1;
    
end

//wr_busy�ź���ʱ����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        wr_busy_d0 <= 1'b0;
        wr_busy_d1 <= 1'b0;
    end    
    else begin
        wr_busy_d0 <= wr_busy;
        wr_busy_d1 <= wr_busy_d0;
    end
end 

//SD�������źſ���
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_start_en <= 1'b0;
        rd_sec_addr <= 32'd0;    
    end
    else begin
        if(neg_wr_busy) begin
            rd_start_en <= 1'b1;
            rd_sec_addr <= 32'd2000;
        end   
        else
            rd_start_en <= 1'b0;          
    end    
end    

//�����ݴ���ʱ������־
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        rd_comp_data <= 16'd0;
        rd_right_cnt <= 9'd0;
    end     
    else begin
        if(rd_val_en) begin
            rd_comp_data <= rd_comp_data + 16'b1;
            if(rd_val_data == rd_comp_data)
                rd_right_cnt <= rd_right_cnt + 9'd1;  
        end    
    end        
end

endmodule