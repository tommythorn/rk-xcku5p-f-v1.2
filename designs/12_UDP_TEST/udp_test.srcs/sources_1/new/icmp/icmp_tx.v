//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           icmp_tx
// Last modified Date:  2022/9/99 9:20:14
// Last Version:        V1.0
// Descriptions:        以太网数据发送模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2022/9/99 9:20:14
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module icmp_tx(    
    input                clk        , //时钟信号
    input                rst_n      , //复位信号，低电平有效
    
    input        [31:0]  reply_checksum, //ICMP数据部分校验和
    input        [15:0]  icmp_id       , //ICMP标识符
    input        [15:0]  icmp_seq      , //ICMP序列号
    input                tx_start_en   , //以太网开始发送信号
    input        [ 7:0]  tx_data       , //以太网待发送数据
    input        [15:0]  tx_byte_num   , //以太网发送的有效字节数
    input        [47:0]  des_mac       , //发送的目标MAC地址
    input        [31:0]  des_ip        , //发送的目标IP地址
    input        [31:0]  crc_data      , //CRC校验数据
    input         [7:0]  crc_next      , //CRC下次校验完成数据
    output  reg          tx_done       , //以太网发送完成信号
    output  reg          tx_req        , //读数据请求信号
    output  reg          gmii_tx_en    , //GMII输出数据有效信号
    output  reg  [7:0]   gmii_txd      , //GMII输出数据
    output  reg          crc_en        , //CRC开始校验使能
    output  reg          crc_clr         //CRC数据复位信号
    );

//parameter define
//开发板MAC地址 00-11-22-33-44-55
parameter BOARD_MAC = 48'h00_11_22_33_44_55;
//开发板IP地址 192.168.1.123     
parameter BOARD_IP  = {8'd192,8'd168,8'd1,8'd123};
//目的MAC地址 ff_ff_ff_ff_ff_ff
parameter DES_MAC   = 48'hff_ff_ff_ff_ff_ff;
//目的IP地址 192.168.1.102     
parameter DES_IP    = {8'd192,8'd168,8'd1,8'd102};

//状态机状态定义
localparam st_idle       = 8'b0000_0001; //初始状态，等待开始发送信号
localparam st_check_sum  = 8'b0000_0010; //IP首部校验和
localparam st_check_icmp = 8'b0000_0100; //ICMP首部+数据校验
localparam st_preamble   = 8'b0000_1000; //发送前导码+帧起始界定符
localparam st_eth_head   = 8'b0001_0000; //发送以太网帧头
localparam st_ip_head    = 8'b0010_0000; //发送IP首部+UDP首部
localparam st_tx_data    = 8'b0100_0000; //发送数据
localparam st_crc        = 8'b1000_0000; //发送CRC校验值

//以太网类型定义
localparam  ETH_TYPE     = 16'h0800    ;  //以太网协议类型 IP协议

//以太网数据最小46个字节，IP首部20个字节+ICMP首部8个字节 
//所以数据至少46-20-8=18个字节
localparam  MIN_DATA_NUM = 16'd18;

//parameter define
//ICMP报文类型:回显应答
parameter ECHO_REPLY   = 8'h00;

//reg define
reg  [7:0]   cur_state           ;
reg  [7:0]   next_state          ;                                
reg  [7:0]   preamble[7:0]       ; //前导码
reg  [7:0]   eth_head[13:0]      ; //以太网首部
reg  [31:0]  ip_head[6:0]        ; //IP首部 + ICMP首部                             
reg          start_en_d0         ;
reg          start_en_d1         ;
reg          start_en_d2         ;
reg  [15:0]  tx_data_num         ; //发送的有效数据字节个数
reg  [15:0]  total_num           ; //总字节数
reg          trig_tx_en          ;
reg          skip_en             ; //控制状态跳转使能信号
reg  [4:0]   cnt                 ;
reg  [31:0]  check_buffer        ; //ip首部校验和
reg  [31:0]  check_buffer_icmp   ; //ip首部校验和
reg  [1:0]   tx_bit_sel          ;
reg  [15:0]  data_cnt            ; //发送数据个数计数器
reg          tx_done_t           ;
reg  [4:0]   real_add_cnt        ; //以太网数据实际多发的字节数
                                    
//wire define                       
wire         pos_start_en    ;//开始发送数据上升沿
wire [15:0]  real_tx_data_num;//实际发送的字节数(以太网最少字节要求)
//*****************************************************
//**                    main code
//*****************************************************

assign  pos_start_en = (~start_en_d2) & start_en_d1;
assign  real_tx_data_num = (tx_data_num >= MIN_DATA_NUM)
                           ? tx_data_num : MIN_DATA_NUM;
                           
//采tx_start_en的上升沿
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        start_en_d0 <= 1'b0;
        start_en_d1 <= 1'b0;
		start_en_d2 <= 1'b0;
    end    
    else begin
        start_en_d0 <= tx_start_en;
        start_en_d1 <= start_en_d0;
		start_en_d2 <= start_en_d1;
    end
end 

////寄存数据有效字节
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        tx_data_num <= 16'd0;
        total_num <= 16'd0;
    end
    else begin
        if(pos_start_en && cur_state==st_idle) begin
            //数据长度
            tx_data_num <= tx_byte_num;
            //IP长度：有效数据+IP首部长度(20bytes)+ICMP首部长度(8bytes)
            total_num <= tx_byte_num + 16'd28;
        end  
		else;
    end
end

//触发发送信号
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) 
        trig_tx_en <= 1'b0;
    else
        trig_tx_en <= pos_start_en;

end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cur_state <= st_idle;
    else
        cur_state <= next_state;
end

always @(*) begin
    next_state = st_idle;
    case(cur_state)
        st_idle     : begin                               //等待发送数据
            if(skip_en)
                next_state = st_check_sum;
            else
                next_state = st_idle;
        end  
        st_check_sum: begin                               //IP首部校验
            if(skip_en)
                next_state = st_check_icmp;
            else
                next_state = st_check_sum;
        end  
        st_check_icmp: begin                               //ICMP首部校验
            if(skip_en)
                next_state = st_preamble;
            else
                next_state = st_check_icmp;
        end  
        st_preamble : begin                               //发送前导码+帧起始界定符
            if(skip_en)
                next_state = st_eth_head;
            else
                next_state = st_preamble;
        end
        st_eth_head : begin                               //发送以太网首部
            if(skip_en)
                next_state = st_ip_head;
            else
                next_state = st_eth_head;
        end              
        st_ip_head : begin                                //发送IP首部+icmp首部
            if(skip_en)
                next_state = st_tx_data;
            else
                next_state = st_ip_head;
        end
        st_tx_data : begin                                //发送数据
            if(skip_en)
                next_state = st_crc;
            else
                next_state = st_tx_data;
        end
        st_crc: begin                                     //发送CRC校验值
            if(skip_en)
                next_state = st_idle;
            else
                next_state = st_crc;
        end
        default : next_state = st_idle;
    endcase
end

//发送数据
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        skip_en <= 1'b0; 
        cnt <= 5'd0;
        check_buffer <= 32'd0;
        check_buffer_icmp <= 32'd0;
        ip_head[1][31:16] <= 16'd0;
        tx_bit_sel <= 2'b0;
        crc_en <= 1'b0;
        gmii_tx_en <= 1'b0;
        gmii_txd <= 8'd0;
        tx_req <= 1'b0;
        tx_done_t <= 1'b0; 
        data_cnt <= 16'd0;
        real_add_cnt <= 5'd0;
        //初始化数组    
        //前导码 7个8'h55 + 1个8'hd5
        preamble[0] <= 8'h55;
        preamble[1] <= 8'h55;
        preamble[2] <= 8'h55;
        preamble[3] <= 8'h55;
        preamble[4] <= 8'h55;
        preamble[5] <= 8'h55;
        preamble[6] <= 8'h55;
        preamble[7] <= 8'hd5;
        //目的MAC地址
        eth_head[0] <= DES_MAC[47:40];
        eth_head[1] <= DES_MAC[39:32];
        eth_head[2] <= DES_MAC[31:24];
        eth_head[3] <= DES_MAC[23:16];
        eth_head[4] <= DES_MAC[15:8];
        eth_head[5] <= DES_MAC[7:0];
        //源MAC地址
        eth_head[6] <= BOARD_MAC[47:40];
        eth_head[7] <= BOARD_MAC[39:32];
        eth_head[8] <= BOARD_MAC[31:24];
        eth_head[9] <= BOARD_MAC[23:16];
        eth_head[10] <= BOARD_MAC[15:8];
        eth_head[11] <= BOARD_MAC[7:0];
        //以太网类型
        eth_head[12] <= ETH_TYPE[15:8];
        eth_head[13] <= ETH_TYPE[7:0];
    end
    else begin
        skip_en <= 1'b0;
        crc_en <= 1'b0;
        gmii_tx_en <= 1'b0;
        tx_done_t <= 1'b0;
        case(next_state)
            st_idle     : begin
                if(trig_tx_en) begin
                    skip_en <= 1'b1; 
                    //版本号：4 首部长度：5(单位:32bit,20byte/4=5)
                    ip_head[0] <= {8'h45,8'h00,total_num};
                    //16位标识，每次发送累加1      
                    ip_head[1][31:16] <= ip_head[1][31:16] + 1'b1;
                    //bit[15:13]: 010表示不分片
                    ip_head[1][15:0] <= 16'h4000;
                    //8'h80：表示生存时间
                    //8'd01：1代表ICMP，2代表IGMP，6代表TCP，17代表UDP
                    ip_head[2] <= {8'h80,8'd01,16'h0000};
                    //源IP地址               
                    ip_head[3] <= BOARD_IP;
                    //目的IP地址    
                    if(des_ip != 32'd0)
                        ip_head[4] <= des_ip;
                    else
                        ip_head[4] <= DES_IP;
                    // 8位icmp TYPE ，8位 icmp CODE 
                    ip_head[5][31:16] <= {ECHO_REPLY,8'h00};
                    //16位identifier 16位sequence
                    ip_head[6] <= {icmp_id,icmp_seq};
                    //更新MAC地址
					
                    if(des_mac != 48'b0) begin
                        //目的MAC地址
                        eth_head[0] <= des_mac[47:40];
                        eth_head[1] <= des_mac[39:32];
                        eth_head[2] <= des_mac[31:24];
                        eth_head[3] <= des_mac[23:16];
                        eth_head[4] <= des_mac[15:8];
                        eth_head[5] <= des_mac[7:0];
                    end
					else;
                end
				else;
            end
            st_check_sum: begin                           //IP首部校验
                cnt <= cnt + 5'd1;
                if(cnt == 5'd0) begin
                    check_buffer <= ip_head[0][31:16] + ip_head[0][15:0]
                                    + ip_head[1][31:16] + ip_head[1][15:0]
                                    + ip_head[2][31:16] + ip_head[2][15:0]
                                    + ip_head[3][31:16] + ip_head[3][15:0]
                                    + ip_head[4][31:16] + ip_head[4][15:0];
                end
                else if(cnt == 5'd1)                      //可能出现进位,累加一次
                    check_buffer <= check_buffer[31:16] + check_buffer[15:0];
                else if(cnt == 5'd2) begin                //可能再次出现进位,累加一次
                    check_buffer <= check_buffer[31:16] + check_buffer[15:0];
                end                             
                else if(cnt == 5'd3) begin                //按位取反 
                    skip_en <= 1'b1;
                    cnt <= 5'd0;            
                    ip_head[2][15:0] <= ~check_buffer[15:0];
                end 
				else;
            end
            st_check_icmp: begin                           //ICMP首部+数据校验
                cnt <= cnt + 5'd1;
                if(cnt == 5'd0) begin
                    check_buffer_icmp <= ip_head[5][31:16] 
                                    + ip_head[6][31:16] + ip_head[6][15:0]
                                    + reply_checksum;
                end
                else if(cnt == 5'd1)                      //可能出现进位,累加一次
                    check_buffer_icmp <= check_buffer_icmp[31:16] + check_buffer_icmp[15:0];
                else if(cnt == 5'd2) begin                //可能再次出现进位,累加一次
                    check_buffer_icmp <= check_buffer_icmp[31:16] + check_buffer_icmp[15:0];
                end                             
                else if(cnt == 5'd3) begin                //按位取反
                    skip_en <= 1'b1;
                    cnt <= 5'd0;
                    // ICMP:16位校验和
                    ip_head[5][15:0] <= ~check_buffer_icmp[15:0];
                end
				else;
            end
            st_preamble : begin                     //发送前导码+帧起始界定符
                gmii_tx_en <= 1'b1;
                gmii_txd <= preamble[cnt];
                if(cnt == 5'd7) begin
                    skip_en <= 1'b1;
                    cnt <= 5'd0;
                end
                else
                    cnt <= cnt + 5'd1;
            end
            st_eth_head : begin                      //发送以太网首部
                gmii_tx_en <= 1'b1;
                crc_en <= 1'b1;
                gmii_txd <= eth_head[cnt];
                if (cnt == 5'd13) begin
                    skip_en <= 1'b1;
                    cnt <= 5'd0;
                end
                else
                    cnt <= cnt + 5'd1;
            end
            st_ip_head  : begin                        //发送IP首部
                crc_en <= 1'b1;
                gmii_tx_en <= 1'b1;
                tx_bit_sel <= tx_bit_sel + 2'd1;
                if(tx_bit_sel == 3'd0)
                    gmii_txd <= ip_head[cnt][31:24];
                else if(tx_bit_sel == 3'd1)
                    gmii_txd <= ip_head[cnt][23:16];
                else if(tx_bit_sel == 3'd2) begin
                    gmii_txd <= ip_head[cnt][15:8];
                    if(cnt == 5'd6) begin
                        //提前读请求数据，等待数据有效时发送
                        tx_req <= 1'b1;
                    end
                end 
                else if(tx_bit_sel == 3'd3) begin
                    gmii_txd <= ip_head[cnt][7:0];
                    if(cnt == 5'd6) begin
                        skip_en <= 1'b1;
                        cnt <= 5'd0;
                    end    
                    else
                        cnt <= cnt + 5'd1;
                end
				else;
            end
            st_tx_data  : begin                           //发送数据
                crc_en <= 1'b1;
                gmii_tx_en <= 1'b1;
				gmii_txd <= tx_data;
                tx_bit_sel <= tx_bit_sel + 3'd1;  
                if(data_cnt < tx_data_num - 16'd1)
                    data_cnt <= data_cnt + 16'd1;
                else if(data_cnt == tx_data_num - 16'd1)begin
                    //如果发送的有效数据少于18个字节，在后面填补充位
                    //补充的值为最后一次发送的有效数据
                    if(data_cnt + real_add_cnt < real_tx_data_num - 16'd1)
                        real_add_cnt <= real_add_cnt + 5'd1;  
                    else begin
                        skip_en <= 1'b1;
                        data_cnt <= 16'd0;
                        real_add_cnt <= 5'd0;
                        tx_bit_sel <= 3'd0;
                    end    
                end
				else;
				
				if(data_cnt == tx_data_num - 16'd2)
					tx_req <= 1'b0; 
				else ;
            end 
            st_crc      : begin                          //发送CRC校验值
                gmii_tx_en <= 1'b1;
                tx_bit_sel <= tx_bit_sel + 3'd1;
				tx_req <= 1'b0; 
                if(tx_bit_sel == 3'd0)
                    gmii_txd <= {~crc_next[0], ~crc_next[1], ~crc_next[2],~crc_next[3],
                                 ~crc_next[4], ~crc_next[5], ~crc_next[6],~crc_next[7]};
                else if(tx_bit_sel == 3'd1)
                    gmii_txd <= {~crc_data[16], ~crc_data[17], ~crc_data[18],~crc_data[19],
                                 ~crc_data[20], ~crc_data[21], ~crc_data[22],~crc_data[23]};
                else if(tx_bit_sel == 3'd2) begin
                    gmii_txd <= {~crc_data[8], ~crc_data[9], ~crc_data[10],~crc_data[11],
                                 ~crc_data[12], ~crc_data[13], ~crc_data[14],~crc_data[15]};
                end
                else if(tx_bit_sel == 3'd3) begin
                    gmii_txd <= {~crc_data[0], ~crc_data[1], ~crc_data[2],~crc_data[3],
                                 ~crc_data[4], ~crc_data[5], ~crc_data[6],~crc_data[7]};
                    tx_done_t <= 1'b1;
                    skip_en <= 1'b1;
                end
				else;
            end
            default :;
        endcase
    end
end

//发送完成信号及crc值复位信号
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        tx_done <= 1'b0;
        crc_clr <= 1'b0;
    end
    else begin
        tx_done <= tx_done_t;
        crc_clr <= tx_done_t;
    end
end

endmodule