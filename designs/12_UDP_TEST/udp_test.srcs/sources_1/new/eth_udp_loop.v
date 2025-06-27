//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           eth_udp_loop
// Last modified Date:  2020/2/18 9:20:14
// Last Version:        V1.0
// Descriptions:        ��̫��ͨ��UDPͨ�Ż��ض���ģ��
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2020/2/18 9:20:14
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module eth_udp_loop(
    input              sys_rst_n , //ϵͳ��λ�źţ��͵�ƽ��Ч 
    //PL��̫��RGMII�ӿ�   
    input              eth_rxc   , //RGMII��������ʱ��
    input              eth_rx_ctl, //RGMII����������Ч�ź�
    input       [3:0]  eth_rxd   , //RGMII��������
    output             eth_txc   , //RGMII��������ʱ��    
    output             eth_tx_ctl, //RGMII���������Ч�ź�
    output      [3:0]  eth_txd     //RGMII�������          
    );

//parameter define
//������MAC��ַ 00-11-22-33-44-55
parameter  BOARD_MAC = 48'h00_11_22_33_44_55;     
//������IP��ַ 192.168.1.10
parameter  BOARD_IP  = {8'd192,8'd168,8'd1,8'd10};  
//Ŀ��MAC��ַ ff_ff_ff_ff_ff_ff
parameter  DES_MAC   = 48'hff_ff_ff_ff_ff_ff;    
//Ŀ��IP��ַ 192.168.1.102     
parameter  DES_IP    = {8'd192,8'd168,8'd1,8'd102};  

//wire define							  
wire          gmii_rx_clk		  ; //GMII����ʱ��
wire          gmii_rx_dv 		  ; //GMII����������Ч�ź�
wire  [7:0]   gmii_rxd   		  ; //GMII��������
wire          gmii_tx_clk		  ; //GMII����ʱ��
wire          gmii_tx_en 		  ; //GMII��������ʹ���ź�
wire  [7:0]   gmii_txd   		  ; //GMII��������     

wire          arp_gmii_tx_en	  ; //ARP GMII���������Ч�ź� 
wire  [7:0]   arp_gmii_txd  	  ; //ARP GMII�������
wire          arp_rx_done   	  ; //ARP��������ź�
wire          arp_rx_type   	  ; //ARP�������� 0:����  1:Ӧ��
wire  [47:0]  src_mac       	  ; //���յ�Ŀ��MAC��ַ
wire  [31:0]  src_ip        	  ; //���յ�Ŀ��IP��ַ    
wire          arp_tx_en     	  ; //ARP����ʹ���ź�
wire          arp_tx_type   	  ; //ARP�������� 0:����  1:Ӧ��
wire  [47:0]  des_mac       	  ; //���͵�Ŀ��MAC��ַ
wire  [31:0]  des_ip        	  ; //���͵�Ŀ��IP��ַ   
wire          arp_tx_done   	  ; //ARP��������ź�

wire          icmp_gmii_tx_en	  ; //ICMP GMII���������Ч�ź� 
wire  [7:0]   icmp_gmii_txd  	  ; //ICMP GMII�������
wire          icmp_rec_pkt_done   ; //ICMP�������ݽ�������ź�
wire          icmp_rec_en         ; //ICMP���յ�����ʹ���ź�
wire  [ 7:0]  icmp_rec_data       ; //ICMP���յ�����
wire  [15:0]  icmp_rec_byte_num   ; //ICMP���յ���Ч�ֽ��� ��λ:byte 
wire  [15:0]  icmp_tx_byte_num    ; //ICMP���͵���Ч�ֽ��� ��λ:byte 
wire          icmp_tx_done   	  ; //ICMP��������ź�
wire          icmp_tx_req         ; //ICMP�����������ź�
wire  [ 7:0]  icmp_tx_data        ; //ICMP����������
wire          icmp_tx_start_en    ; //ICMP���Ϳ�ʼʹ���ź�

wire          udp_gmii_tx_en	  ; //UDP GMII���������Ч�ź� 
wire  [7:0]   udp_gmii_txd  	  ; //UDP GMII�������
wire          rec_pkt_done  	  ; //UDP�������ݽ�������ź�
wire          udp_rec_en    	  ; //UDP���յ�����ʹ���ź�
wire  [ 7:0]  udp_rec_data  	  ; //UDP���յ�����
wire  [15:0]  rec_byte_num  	  ; //UDP���յ���Ч�ֽ��� ��λ:byte 
wire  [15:0]  tx_byte_num   	  ; //UDP���͵���Ч�ֽ��� ��λ:byte 
wire          udp_tx_done   	  ; //UDP��������ź�
wire          udp_tx_req    	  ; //UDP�����������ź�
wire  [ 7:0]  udp_tx_data   	  ; //UDP����������
wire          tx_start_en   	  ; //UDP���Ϳ�ʼʹ���ź�
								  
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

//GMII�ӿ�תRGMII�ӿ�
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

//ARPͨ��
arp                                             
   #(
    .BOARD_MAC     (BOARD_MAC),      //��������
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

//ICMPͨ��
icmp                                             
   #(
    .BOARD_MAC     (BOARD_MAC),      //��������
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

//UDPͨ��
udp                                             
   #(
    .BOARD_MAC     (BOARD_MAC),      //��������
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

//�첽FIFO
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

//��̫������ģ��
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