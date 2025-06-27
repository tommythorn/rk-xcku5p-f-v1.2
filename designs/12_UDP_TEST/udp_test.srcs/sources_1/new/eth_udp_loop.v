//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：www.openedv.com
//淘宝店铺：http://openedv.taobao.com 
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           eth_udp_loop
// Last modified Date:  2020/2/18 9:20:14
// Last Version:        V1.0
// Descriptions:        以太网通信UDP通信环回顶层模块
//----------------------------------------------------------------------------------------
// Created by:          正点原子
// Created date:        2020/2/18 9:20:14
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module eth_udp_loop(
    input              sys_rst_n , //系统复位信号，低电平有效 
    //PL以太网RGMII接口   
    input              eth_rxc   , //RGMII接收数据时钟
    input              eth_rx_ctl, //RGMII输入数据有效信号
    input       [3:0]  eth_rxd   , //RGMII输入数据
    output             eth_txc   , //RGMII发送数据时钟    
    output             eth_tx_ctl, //RGMII输出数据有效信号
    output      [3:0]  eth_txd     //RGMII输出数据          
    );

//parameter define
//开发板MAC地址 00-11-22-33-44-55
parameter  BOARD_MAC = 48'h00_11_22_33_44_55;     
//开发板IP地址 192.168.1.10
parameter  BOARD_IP  = {8'd192,8'd168,8'd1,8'd10};  
//目的MAC地址 ff_ff_ff_ff_ff_ff
parameter  DES_MAC   = 48'hff_ff_ff_ff_ff_ff;    
//目的IP地址 192.168.1.102     
parameter  DES_IP    = {8'd192,8'd168,8'd1,8'd102};  

//wire define							  
wire          gmii_rx_clk		  ; //GMII接收时钟
wire          gmii_rx_dv 		  ; //GMII接收数据有效信号
wire  [7:0]   gmii_rxd   		  ; //GMII接收数据
wire          gmii_tx_clk		  ; //GMII发送时钟
wire          gmii_tx_en 		  ; //GMII发送数据使能信号
wire  [7:0]   gmii_txd   		  ; //GMII发送数据     

wire          arp_gmii_tx_en	  ; //ARP GMII输出数据有效信号 
wire  [7:0]   arp_gmii_txd  	  ; //ARP GMII输出数据
wire          arp_rx_done   	  ; //ARP接收完成信号
wire          arp_rx_type   	  ; //ARP接收类型 0:请求  1:应答
wire  [47:0]  src_mac       	  ; //接收到目的MAC地址
wire  [31:0]  src_ip        	  ; //接收到目的IP地址    
wire          arp_tx_en     	  ; //ARP发送使能信号
wire          arp_tx_type   	  ; //ARP发送类型 0:请求  1:应答
wire  [47:0]  des_mac       	  ; //发送的目标MAC地址
wire  [31:0]  des_ip        	  ; //发送的目标IP地址   
wire          arp_tx_done   	  ; //ARP发送完成信号

wire          icmp_gmii_tx_en	  ; //ICMP GMII输出数据有效信号 
wire  [7:0]   icmp_gmii_txd  	  ; //ICMP GMII输出数据
wire          icmp_rec_pkt_done   ; //ICMP单包数据接收完成信号
wire          icmp_rec_en         ; //ICMP接收的数据使能信号
wire  [ 7:0]  icmp_rec_data       ; //ICMP接收的数据
wire  [15:0]  icmp_rec_byte_num   ; //ICMP接收的有效字节数 单位:byte 
wire  [15:0]  icmp_tx_byte_num    ; //ICMP发送的有效字节数 单位:byte 
wire          icmp_tx_done   	  ; //ICMP发送完成信号
wire          icmp_tx_req         ; //ICMP读数据请求信号
wire  [ 7:0]  icmp_tx_data        ; //ICMP待发送数据
wire          icmp_tx_start_en    ; //ICMP发送开始使能信号

wire          udp_gmii_tx_en	  ; //UDP GMII输出数据有效信号 
wire  [7:0]   udp_gmii_txd  	  ; //UDP GMII输出数据
wire          rec_pkt_done  	  ; //UDP单包数据接收完成信号
wire          udp_rec_en    	  ; //UDP接收的数据使能信号
wire  [ 7:0]  udp_rec_data  	  ; //UDP接收的数据
wire  [15:0]  rec_byte_num  	  ; //UDP接收的有效字节数 单位:byte 
wire  [15:0]  tx_byte_num   	  ; //UDP发送的有效字节数 单位:byte 
wire          udp_tx_done   	  ; //UDP发送完成信号
wire          udp_tx_req    	  ; //UDP读数据请求信号
wire  [ 7:0]  udp_tx_data   	  ; //UDP待发送数据
wire          tx_start_en   	  ; //UDP发送开始使能信号
								  
wire  [7:0]	  rec_data			  ;
wire		  rec_en			  ;
wire		  tx_req			  ;
wire  [7:0]	  tx_data	    	  ;
//*****************************************************
//**                    main code
//*****************************************************

assign icmp_tx_start_en = icmp_rec_pkt_done;
assign icmp_tx_byte_num = icmp_rec_byte_num;

assign tx_start_en = rec_pkt_done;
assign tx_byte_num = rec_byte_num;
assign des_mac = src_mac;
assign des_ip = src_ip;
assign eth_txc = clk_125m_deg;

//MMCM/PLL
clk_wiz_0 u_clk_wiz_0
   (
    .clk_out1(clk_125m_deg),     // output clk_out1
    .reset(~sys_rst_n), 	 // input reset
    .locked(locked),         // output locked
    .clk_in1(rgmii_txc)
    );  

//GMII接口转RGMII接口
gmii_to_rgmii u_gmii_to_rgmii(
    .gmii_rx_clk   (gmii_rx_clk ),
    .gmii_rx_dv    (gmii_rx_dv  ),
    .gmii_rxd      (gmii_rxd    ),
    .gmii_tx_clk   (gmii_tx_clk ),
    .gmii_tx_en    (gmii_tx_en  ),
    .gmii_txd      (gmii_txd    ),
    
    .rgmii_rxc     (eth_rxc     ),  
    .rgmii_rx_ctl  (eth_rx_ctl  ),
    .rgmii_rxd     (eth_rxd     ),
    .rgmii_txc     (rgmii_txc   ),
    .rgmii_tx_ctl  (eth_tx_ctl  ),
    .rgmii_txd     (eth_txd     )
    );

//ARP通信
arp                                             
   #(
    .BOARD_MAC     (BOARD_MAC),      //参数例化
    .BOARD_IP      (BOARD_IP ),
    .DES_MAC       (DES_MAC  ),
    .DES_IP        (DES_IP   )
    )
   u_arp(
    .rst_n         (sys_rst_n  	  ),
                    
    .gmii_rx_clk   (gmii_rx_clk	  ),
    .gmii_rx_dv    (gmii_rx_dv 	  ),
    .gmii_rxd      (gmii_rxd   	  ),
    .gmii_tx_clk   (gmii_tx_clk	  ),
    .gmii_tx_en    (arp_gmii_tx_en),
    .gmii_txd      (arp_gmii_txd  ),
                    
    .arp_rx_done   (arp_rx_done	  ),
    .arp_rx_type   (arp_rx_type	  ),
    .src_mac       (src_mac    	  ),
    .src_ip        (src_ip     	  ),
    .arp_tx_en     (arp_tx_en  	  ),
    .arp_tx_type   (arp_tx_type	  ),
    .des_mac       (des_mac    	  ),
    .des_ip        (des_ip     	  ),
    .tx_done       (arp_tx_done	  )
    );

//ICMP通信
icmp                                             
   #(
    .BOARD_MAC     (BOARD_MAC),      //参数例化
    .BOARD_IP      (BOARD_IP ),
    .DES_MAC       (DES_MAC  ),
    .DES_IP        (DES_IP   )
    )
   u_icmp(
    .rst_n         (sys_rst_n   	 ),  
		 
    .gmii_rx_clk   (gmii_rx_clk 	 ),           
    .gmii_rx_dv    (gmii_rx_dv  	 ),         
    .gmii_rxd      (gmii_rxd    	 ),                   
    .gmii_tx_clk   (gmii_tx_clk 	 ), 
    .gmii_tx_en    (icmp_gmii_tx_en	 ),         
    .gmii_txd      (icmp_gmii_txd	 ),  

    .rec_pkt_done  (icmp_rec_pkt_done),    
    .rec_en        (icmp_rec_en      ), 		  
    .rec_data      (icmp_rec_data    ),   	    
    .rec_byte_num  (icmp_rec_byte_num),      
    .tx_start_en   (icmp_tx_start_en ),        
    .tx_data       (icmp_tx_data     ),       
    .tx_byte_num   (icmp_tx_byte_num ),  
    .des_mac       (des_mac     	 ),
    .des_ip        (des_ip      	 ),    
    .tx_done       (icmp_tx_done	 ),        
    .tx_req        (icmp_tx_req      )        
    ); 

//UDP通信
udp                                             
   #(
    .BOARD_MAC     (BOARD_MAC),      //参数例化
    .BOARD_IP      (BOARD_IP ),
    .DES_MAC       (DES_MAC  ),
    .DES_IP        (DES_IP   )
    )
   u_udp(
    .rst_n         (sys_rst_n   ),  
    
    .gmii_rx_clk   (gmii_rx_clk ),           
    .gmii_rx_dv    (gmii_rx_dv  ),         
    .gmii_rxd      (gmii_rxd    ),                   
    .gmii_tx_clk   (gmii_tx_clk ), 
    .gmii_tx_en    (udp_gmii_tx_en),         
    .gmii_txd      (udp_gmii_txd),  

    .rec_pkt_done  (rec_pkt_done),    
    .rec_en        (udp_rec_en  ),     
    .rec_data      (udp_rec_data),         
    .rec_byte_num  (rec_byte_num),      
    .tx_start_en   (tx_start_en ),        
    .tx_data       (udp_tx_data ),         
    .tx_byte_num   (tx_byte_num ),  
    .des_mac       (des_mac     ),
    .des_ip        (des_ip      ),    
    .tx_done       (udp_tx_done ),        
    .tx_req        (udp_tx_req  )           
    ); 

//异步FIFO
fifo_generator_0 fifo_generator_0_inst (
  .rst		(~sys_rst_n	)	,       // input wire rst
//  .wr_clk	(gmii_rx_clk)	,  		// input wire wr_clk
//  .rd_clk	(gmii_rx_clk)	,  		// input wire rd_clk
      .clk      (gmii_rx_clk),  // input wire clk

  .din		(rec_data	)	,       // input wire [7 : 0] din
  .wr_en	(rec_en		)	,    	// input wire wr_en
  .rd_en	(tx_req		)	,    	// input wire rd_en
  .dout		(tx_data	)	,      	// output wire [7 : 0] dout
  .full		()				,      	// output wire full
  .empty	()    					// output wire empty
);

//以太网控制模块
eth_ctrl u_eth_ctrl(
    .clk            	(gmii_rx_clk	 ),
    .rst_n          	(sys_rst_n		 ),
										 
    .arp_rx_done    	(arp_rx_done   	 ),
    .arp_rx_type    	(arp_rx_type   	 ),
    .arp_tx_en      	(arp_tx_en     	 ),
    .arp_tx_type    	(arp_tx_type   	 ),
    .arp_tx_done    	(arp_tx_done   	 ),
    .arp_gmii_tx_en 	(arp_gmii_tx_en	 ),
    .arp_gmii_txd   	(arp_gmii_txd  	 ),
										 
    .icmp_tx_start_en	(icmp_tx_start_en),
    .icmp_tx_done		(icmp_tx_done	 ),
    .icmp_gmii_tx_en	(icmp_gmii_tx_en ),
    .icmp_gmii_txd		(icmp_gmii_txd	 ),
										 
	.icmp_rec_en       	(icmp_rec_en     ),
	.icmp_rec_data     	(icmp_rec_data   ),
	.icmp_tx_req       	(icmp_tx_req     ),
	.icmp_tx_data      	(icmp_tx_data    ),
										 
    .udp_tx_start_en	(tx_start_en   	 ),
    .udp_tx_done    	(udp_tx_done   	 ),    
    .udp_gmii_tx_en 	(udp_gmii_tx_en	 ),
    .udp_gmii_txd   	(udp_gmii_txd  	 ),
										 
	.udp_rec_data		(udp_rec_data	 ),		
	.udp_rec_en			(udp_rec_en		 ),    
	.udp_tx_req			(udp_tx_req		 ),    
	.udp_tx_data		(udp_tx_data	 ),		
										 
	.rec_data			(rec_data	     ),	
	.rec_en	        	(rec_en	         ),
    .tx_req	        	(tx_req	         ),
	.tx_data	    	(tx_data	     ),
										 
    .gmii_tx_en     	(gmii_tx_en    	 ),
    .gmii_txd       	(gmii_txd      	 )
    );
	
endmodule