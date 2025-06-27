module usart_rx(
				 input wire clock,
				 input wire rxd,
				 input wire rst_n,
				 output wire [7:0]rx_data_byte,
				 output wire rx_valid_wire
				);
				
parameter CLOCK_FRQ=50_000_000;	
parameter BADRATE	 =115_200;
parameter UART_COUTER_MAX=CLOCK_FRQ/BADRATE;
parameter UART_BIT =8;

reg [7:0]rx_data_byte_reg;
reg rx_start_flag;
reg [19:0]rx_counter;
reg [19:0]baud_counter;
reg baud_rat_clk;

reg rxd_reg1;
reg rxd_reg2;
reg rxd_reg3;
wire rxd_negedge;
reg [7:0]rx_bit_cnt;
reg [7:0]rx_data;
reg rx_valid_flag_pre1;
reg rx_valid_flag_pre2;
wire rx_valid_flag;

assign rx_valid_wire=rx_valid_flag_pre2;
assign rx_valid_flag=(rx_bit_cnt==9)?1:0;
assign rxd_negedge=~rxd_reg2&rxd_reg3;

assign rx_data_byte=rx_data_byte_reg;
assign clk_badrate=baud_rat_clk;
always @(posedge clock)
begin
	rxd_reg1<=rxd;
	rxd_reg2<=rxd_reg1;
	rxd_reg3<=rxd_reg2;
end

always @(posedge clock or negedge rst_n)
begin
	if(rst_n==0)
	begin
		baud_counter<=0;
		baud_rat_clk=0;
	end
	else begin
	rx_valid_flag_pre2<=rx_valid_flag_pre1;
	rx_valid_flag_pre1=rx_valid_flag;
			baud_counter<=baud_counter+1;
			if(baud_counter==UART_COUTER_MAX)
			begin
				baud_counter<=0;
				baud_rat_clk<=~baud_rat_clk;
			end
	end
end

always @(posedge clock or negedge rst_n)
begin
	if(rst_n==0)rx_counter<=0;
	else begin
		if(rx_start_flag==1)
		begin
			rx_counter<=rx_counter+1;
			if(rx_counter==UART_COUTER_MAX)rx_counter<=0;
		end
	end
end

always @(posedge clock or negedge rst_n)
begin
	if(rst_n==0)rx_bit_cnt<=0;
	else 
	begin
		if(rx_counter==UART_COUTER_MAX)
		begin
			rx_bit_cnt<=rx_bit_cnt+1;
		end
		if(rx_bit_cnt==UART_BIT+1)rx_bit_cnt<=0;
		if(rx_bit_cnt==UART_BIT+1)rx_data_byte_reg<=rx_data;
	end
end

always @(posedge clock  or negedge rst_n)
begin
	if(rst_n==0)
	begin
		rx_data<=0;
	end
	else 	begin
		if(rx_counter==UART_COUTER_MAX/2)
		begin
			if((rx_bit_cnt>=1)&&(rx_bit_cnt<UART_BIT+1))
			begin
				rx_data<={rxd,rx_data[7:1]};
			end
		end
	end
end

always @(posedge clock  or negedge rst_n)
begin
	if(rst_n==0)
	begin
		rx_start_flag<=0;
	end
	else 
	begin
		if(rxd_negedge==1)rx_start_flag<=1;
		else if(rx_bit_cnt==UART_BIT+1)rx_start_flag<=0;
	end
end
endmodule



