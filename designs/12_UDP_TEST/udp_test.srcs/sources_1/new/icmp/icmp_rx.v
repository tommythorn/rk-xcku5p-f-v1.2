//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           icmp_rx
// Last modified Date:  2022/9/22 9:20:14
// Last Version:        V1.0
// Descriptions:        以太网数据接收模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2022/9/22 9:20:14
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module icmp_rx(
    input                clk         ,    //时钟信号
    input                rst_n       ,    //复位信号，低电平有效
    
    input                gmii_rx_dv  ,    //GMII输入数据有效信号
    input        [7:0]   gmii_rxd    ,    //GMII输入数据
    output  reg          rec_pkt_done,    //以太网单包数据接收完成信号
    output  reg          rec_en      ,    //以太网接收的数据使能信号
    output  reg  [ 7:0]  rec_data    ,    //以太网接收的数据
    output  reg  [15:0]  rec_byte_num,    //以太网接收的有效字数 单位:byte 

    output  reg  [15:0]  icmp_id     ,    //ICMP标识符
    output  reg  [15:0]  icmp_seq    ,    //ICMP序列号
    output  reg  [31:0]  reply_checksum   //接收数据校验
   
    );

//parameter define
//开发板MAC地址 00-11-22-33-44-55
parameter BOARD_MAC = 48'h00_11_22_33_44_55; 
//开发板IP地址 192.168.1.10 
parameter BOARD_IP  = {8'd192,8'd168,8'd1,8'd10};

//状态机状态定义
localparam  st_idle             = 7'b000_0001; //初始状态，等待接收前导码
localparam  st_preamble         = 7'b000_0010; //接收前导码状态 
localparam  st_eth_head         = 7'b000_0100; //接收以太网帧头
localparam  st_ip_head          = 7'b000_1000; //接收IP首部
localparam  st_icmp_head        = 7'b001_0000; //接收ICMP首部
localparam  st_rx_data          = 7'b010_0000; //接收有效数据
localparam  st_rx_end           = 7'b100_0000; //接收结束

//以太网类型定义
localparam  ETH_TYPE    = 16'h0800   ; //以太网协议类型 IP协议
localparam  ICMP_TYPE   = 8'd1       ; //ICMP协议类型

//ICMP报文类型:回显请求
localparam ECHO_REQUEST = 8'h08 ; 

//reg define
reg  [6:0]   cur_state       ;
reg  [6:0]   next_state      ;                             
reg          skip_en         ; //控制状态跳转使能信号
reg          error_en        ; //解析错误使能信号
reg  [4:0]   cnt             ; //解析数据计数器
reg  [47:0]  des_mac         ; //目的MAC地址
reg  [15:0]  eth_type        ; //以太网类型
reg  [31:0]  des_ip          ; //目的IP地址
reg  [5:0]   ip_head_byte_num; //IP首部长度
reg  [15:0]  total_length    ; //IP长度 
reg  [1:0]   rec_en_cnt      ; //8bit转32bit计数器
reg  [7:0]   icmp_type        ;//ICMP报文类型:用于标识错误类型的差错报文或者查询类型的报告报文
reg  [7:0]   icmp_code        ;//ICMP报文代码:根据ICMP差错报文的类型，进一步分析错误的原因，代码值不同对应的错误也不同
			 				   //例如：类型为11且代码为0，表示数据传输过程中超时了，超时的具体原因是TTL值为0，数据报被丢弃。
reg  [15:0]  icmp_checksum    ;//接收校验和:数据发送到目的地后需要对ICMP数据报文做一个校验，用于检查数据报文是否有错误
reg  [15:0]  icmp_data_length ;//data length register
reg  [15:0]  icmp_rx_cnt      ;//接收数据计数
reg  [7:0]   icmp_rx_data_d0  ;
reg  [31:0]  reply_checksum_add ;
//****************************************************
//**                    main code
//*****************************************************

//(三段式状态机)同步时序描述状态转移
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cur_state <= st_idle;  
    else
        cur_state <= next_state;
end

//组合逻辑判断状态转移条件
always @(*) begin
    next_state = st_idle;
    case(cur_state)
        st_idle : begin                       //等待接收前导码
            if(skip_en) 
                next_state = st_preamble;
            else
                next_state = st_idle; 
        end
        st_preamble : begin                   //接收前导码
            if(skip_en) 
                next_state = st_eth_head;
            else if(error_en) 
                next_state = st_rx_end; 
            else
                next_state = st_preamble; 
        end
        st_eth_head : begin                   //接收以太网帧头
            if(skip_en) 
                next_state = st_ip_head;
            else if(error_en) 
                next_state = st_rx_end;
            else
                next_state = st_eth_head; 
        end  
        st_ip_head : begin                    //接收IP首部
            if(skip_en)
                next_state = st_icmp_head;
            else if(error_en)
                next_state = st_rx_end;
            else
                next_state = st_ip_head; 
        end 
        st_icmp_head : begin                   //接收ICMP首部
            if(skip_en)
                next_state = st_rx_data;
            else if(error_en)
                next_state = st_rx_end;
            else
                next_state = st_icmp_head;
        end 
        st_rx_data : begin                     //接收有效数据
            if(skip_en)
                next_state = st_rx_end;
            else
                next_state = st_rx_data; 
        end 
        st_rx_end : begin                      //接收结束
            if(skip_en)
                next_state = st_idle;
            else
                next_state = st_rx_end;
        end
        default : next_state = st_idle;
    endcase 
end 

//时序电路描述状态输出,解析以太网数据
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        skip_en <= 1'b0;
        error_en <= 1'b0;
        cnt <= 5'd0;
        des_mac <= 48'd0;
        eth_type <= 16'd0;
        des_ip <= 32'd0;
        ip_head_byte_num <= 6'd0;
        
        total_length <= 16'd0;
        
        icmp_type <= 8'd0;
        icmp_code <= 8'd0;
        icmp_checksum <= 16'd0;
        icmp_id <= 16'd0;
        icmp_seq <= 16'd0;
        
        icmp_rx_data_d0 <= 8'd0 ;
        reply_checksum <= 32'd0;  //累加
        reply_checksum_add <= 32'd0;
        icmp_rx_cnt <= 16'd0;
        icmp_data_length <= 16'd0;
        
        rec_en_cnt <= 2'd0;
        rec_en <= 1'b0;
        rec_data <= 32'd0;
        rec_pkt_done <= 1'b0;
        rec_byte_num <= 16'd0;
    end
    else begin
        skip_en <= 1'b0;
        error_en <= 1'b0;  
        rec_pkt_done <= 1'b0;
        case(next_state)
            st_idle : begin
                if((gmii_rx_dv == 1'b1) && (gmii_rxd == 8'h55)) 
                    skip_en <= 1'b1;
				else;
            end
            st_preamble : begin
                if(gmii_rx_dv) begin                         //解析前导码
                    cnt <= cnt + 5'd1;
                    if((cnt < 5'd6) && (gmii_rxd != 8'h55))  //7个8'h55
                        error_en <= 1'b1;
                    else if(cnt==5'd6) begin
                        cnt <= 5'd0;
                        if(gmii_rxd==8'hd5)                  //1个8'hd5
                            skip_en <= 1'b1;
                        else
                            error_en <= 1'b1; 
                    end  
					else;
                end  
            end
            st_eth_head : begin
                if(gmii_rx_dv) begin
                    cnt <= cnt + 5'b1;
                    if(cnt < 5'd6) 
                        des_mac <= {des_mac[39:0],gmii_rxd}; //目的MAC地址
                    else if(cnt == 5'd12) 
                        eth_type[15:8] <= gmii_rxd;          //以太网协议类型
                    else if(cnt == 5'd13) begin
                        eth_type[7:0] <= gmii_rxd;
                        cnt <= 5'd0;
                        //判断MAC地址是否为开发板MAC地址或者公共地址
                        if(((des_mac == BOARD_MAC) ||(des_mac == 48'hff_ff_ff_ff_ff_ff))
                       && eth_type[15:8] == ETH_TYPE[15:8] && gmii_rxd == ETH_TYPE[7:0])
                            skip_en <= 1'b1;
                        else
                            error_en <= 1'b1;
                    end 
					else;
                end 
				else;
            end
            st_ip_head : begin
                if(gmii_rx_dv) begin  //cnt ip首20个byte计数
                    cnt <= cnt + 5'd1;
                    if(cnt == 5'd0)
                        ip_head_byte_num <= {gmii_rxd[3:0],2'd0};
                    else if (cnt == 5'd2) 
                        total_length[15:8] <= gmii_rxd;
                    else if (cnt == 5'd3)
                        total_length[7:0] <= gmii_rxd;
                    else if (cnt == 5'd4)
					//有效数据字节长度，（IP首部20个字节，icmp首部8个字节，所以减去28）
                        icmp_data_length <= total_length - 16'd28; 
					else if(cnt == 5'd9) begin
                        if(gmii_rxd != ICMP_TYPE) begin
                            //如果当前接收的数据不是ICMP协议，停止解析数据                        
                            error_en <= 1'b1;               
                            cnt <= 5'd0;                        
                        end
                    end
                    else if((cnt >= 5'd16) && (cnt <= 5'd18))
                        des_ip <= {des_ip[23:0],gmii_rxd};   //目的IP地址
                    else if(cnt == 5'd19) begin
                        des_ip <= {des_ip[23:0],gmii_rxd}; 
                        //判断IP地址是否为开发板IP地址
                        if((des_ip[23:0] == BOARD_IP[31:8])
                            && (gmii_rxd == BOARD_IP[7:0])) begin  
                            skip_en <=1'b1; 
                            cnt <= 5'd0;
                        end 
                        else begin 
                        //IP错误，停止解析数据 
                            error_en <= 1'b1; 
                            cnt <= 5'd0;
                        end 
                    end 
					else;
                end 
				else;
            end
            st_icmp_head : begin
                if(gmii_rx_dv) begin  //cnt ICMP首8个byte计数
                    cnt <= cnt + 5'd1;
                    if(cnt == 5'd0)
                        icmp_type <= gmii_rxd;
                    else if(cnt == 5'd1)
                        icmp_code <= gmii_rxd;
                    else if(cnt == 5'd2)
                        icmp_checksum[15:8] <= gmii_rxd;
                    else if(cnt == 5'd3)
                        icmp_checksum[7:0] <= gmii_rxd;
                    else if(cnt == 5'd4)
                        icmp_id[15:8] <= gmii_rxd;
                    else if(cnt == 5'd5)
                        icmp_id[7:0] <= gmii_rxd;
                    else if(cnt == 5'd6)
                        icmp_seq[15:8] <= gmii_rxd;
                    else if(cnt == 5'd7)begin
                        icmp_seq[7:0] <= gmii_rxd;
                        //判断ICMP报文类型是否是回显请求
                        if(icmp_type == ECHO_REQUEST) begin
                                skip_en <=1'b1;
                                cnt <= 5'd0;
                        end 
                        else begin 
                        //ICMP报文类型错误，停止解析数据
                            error_en <= 1'b1; 
                            cnt <= 5'd0;
                        end 
                    end 
					else;
                end 
				else;
            end 
            st_rx_data : begin         
                //接收数据           
                if(gmii_rx_dv) begin
                    rec_en_cnt <= rec_en_cnt + 2'd1;
                    icmp_rx_cnt <= icmp_rx_cnt + 16'd1;
					rec_data <= gmii_rxd;
					rec_en <= 1'b1;
					
					//判断接收到数据的奇偶个数
                   if (icmp_rx_cnt == icmp_data_length - 1) begin                      
                        icmp_rx_data_d0 <= 8'h00;
                        if(icmp_data_length[0])		//判断接收到数据是否为奇数个数
                            reply_checksum_add <= {8'd0,gmii_rxd} + reply_checksum_add;                           
                        else
                            reply_checksum_add <= {icmp_rx_data_d0,gmii_rxd} + reply_checksum_add;    
                    end
                    else if(icmp_rx_cnt < icmp_data_length) begin
                        icmp_rx_data_d0 <= gmii_rxd;
                        icmp_rx_cnt <= icmp_rx_cnt + 16'd1;
                        if (icmp_rx_cnt[0] == 1'b1)
                            reply_checksum_add <= {icmp_rx_data_d0,gmii_rxd} + reply_checksum_add; 
                        else
                            reply_checksum_add <= reply_checksum_add; 
                    end
                    
					else;
					
                    if(icmp_rx_cnt == icmp_data_length - 16'd1) begin
                        skip_en <= 1'b1;                    //有效数据接收完成
                        icmp_rx_cnt <= 16'd0;
                        rec_en_cnt <= 2'd0;
                        rec_pkt_done <= 1'b1;               
                        rec_byte_num <= icmp_data_length;
                    end 
					else;
                end
				else;
            end
            st_rx_end : begin                               //单包数据接收完成
				rec_en <= 1'b0;
                if(gmii_rx_dv == 1'b0 && skip_en == 1'b0)begin
                    reply_checksum <= reply_checksum_add ;
                    skip_en <= 1'b1;
                    reply_checksum_add <= 32'd0;
                end
				else;
            end    
            default : ;
        endcase
    end
end

endmodule