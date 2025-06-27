//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved
//----------------------------------------------------------------------------------------
// File name:           led_alarm
// Last modified Date:  2020/05/28 20:28:08
// Last Version:        V1.0
// Descriptions:        LED������ʾʵ��ɹ���LED��˸��ʾʵ��ʧ��SD����д����
//                      
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2020/05/28 20:28:08
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module led_alarm #(parameter    L_TIME = 25'd25_000_000  // ����led��˸ʱ�䣨��Ϊ500ms��
    )(
        //system clock
        input             clk       ,  // ʱ���ź�
        input             rst_n     ,  // ��λ�ź�
        //led interface
        output            led       ,  // LED ��
        //user interface
        input             error_flag   // �����־
);

//reg define
reg                 led_t  ;             // ʹ�õ�led��
reg    [24:0]     led_cnt;             // led����

//*****************************************************
//**                    main code
//*****************************************************

//led���
assign  led = led_t;

//�����־Ϊ1ʱled��˸������LED0����
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        led_cnt <= 25'd0;
        led_t <= 1'b0;
    end
    else begin
        if(error_flag) begin                  // ������ֵ����
            if(led_cnt == L_TIME - 1'b1) begin       // ���ݴ���ʱLED��ÿ��L_TIMEʱ����˸һ��
                led_cnt <= 25'd0;
                led_t <= ~led_t;
            end
            else
                led_cnt <= led_cnt + 25'd1;
        end
        else begin                            // �����Ҷ�����ֵ��ȷ
            led_cnt <= 25'd0;
            led_t <= 1'b1;                    // led�Ƴ���
        end
    end
end

endmodule