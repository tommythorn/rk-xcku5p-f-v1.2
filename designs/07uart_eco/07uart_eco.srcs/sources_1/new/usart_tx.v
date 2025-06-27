module usart_tx(
				 input wire clock,
				 output wire txd,
				 input wire rst_n,
				 input wire [7:0]tx_data_byte,
				 input wire tx_triger_flag
				);
				
parameter CLOCK_FRQ=50_000_000;	
parameter BADRATE	 =115_200;
parameter UART_COUTER_MAX=CLOCK_FRQ/BADRATE;
parameter UART_BIT =8;

reg [7:0]tx_bit_cnt_reg;
reg [19:0]tx_counter;
reg [19:0]baud_counter;

reg txd_reg;
reg tx_start_flag;
assign txd=txd_reg;

always @(posedge clock)

begin
  if(tx_start_flag==1)
    begin     
		case (tx_bit_cnt_reg)
			0:txd_reg<=0;
			1:txd_reg<=tx_data_byte[0];
			2:txd_reg<=tx_data_byte[1];
			3:txd_reg<=tx_data_byte[2]; 
			4:txd_reg<=tx_data_byte[3]; 
			5:txd_reg<=tx_data_byte[4];  
			6:txd_reg<=tx_data_byte[5];  
			7:txd_reg<=tx_data_byte[6];  
			8:txd_reg<=tx_data_byte[7];  
			9:txd_reg<=1; 
			default:txd_reg<=1;  
     endcase 
  end
 else txd_reg<=1;
end

always @(posedge tx_triger_flag or posedge clock)
begin
	if(tx_triger_flag==1)tx_start_flag<=1;
	else begin
		if(tx_bit_cnt_reg==UART_BIT+1)tx_start_flag<=0;
	end
end

always @(posedge clock or negedge rst_n)
begin
	if(rst_n==0)
	begin
		tx_counter<=0;
	end
	else begin
		if(tx_start_flag==1)begin
			if(tx_counter<UART_COUTER_MAX)tx_counter<=tx_counter+1;
			else begin
				tx_counter<=0;
			end
		end	
	end
end

always @(posedge clock or negedge rst_n)
begin
	if(rst_n==0)
	begin
		tx_bit_cnt_reg<=0;
	end
	else begin
	 	if(tx_counter==UART_COUTER_MAX)
			begin
				if(tx_bit_cnt_reg<UART_BIT+1)tx_bit_cnt_reg<=tx_bit_cnt_reg+1;
			end   
		else begin	 	   	
			if(tx_bit_cnt_reg==UART_BIT+1)tx_bit_cnt_reg<=0;
		end 
	end
end

endmodule


