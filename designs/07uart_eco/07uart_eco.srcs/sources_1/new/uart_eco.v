module uart_eco(
						    input wire rst_n,
  (*mark_debug="true"*)	    input wire clk,
  (*mark_debug="true"*)		input wire rxd,
  (*mark_debug="true"*)		output wire txd
						);
							
							
/****************************************//*
�����շ��ػ�ʵ������
*//*****************************************/
  (*mark_debug="true"*)wire [7:0]uart_data_wire_tx;
  (*mark_debug="true"*)wire rx_flag;

//���ڽ���ģ��
usart_rx usart_rx_inst(
                        .clock(clk),
                        .rxd(rxd),
                        .rst_n(rst_n),
                        .rx_data_byte(uart_data_wire_tx),
                        .rx_valid_wire(rx_flag)
                      );
				
//���ڷ���ģ��
 usart_tx  usart_tx_inst(
                        .clock(clk),
                        .txd(txd),
                        .rst_n(rst_n),
                        .tx_data_byte(uart_data_wire_tx),
                        .tx_triger_flag(rx_flag)
                     );		
								 				 
endmodule
