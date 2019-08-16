`timescale 1ns / 1ps

module UART(clk,
				reset,
				
				rx,
				rx_done_tick,
				rx_out,
				
				tx_start,
				tx_in,
	         tx_done_tick,
				tx
);
	 
	 input clk;
	 input reset;
	 //Receive Ports
	 input  rx;
	 output rx_done_tick;
	 output [7:0] rx_out;
	 
	 //Sender Ports
	 input  tx_start;
	 input  [7:0] tx_in;
	 output tx_done_tick;
	 output tx;
	 
	BR_Generator bdg( 
			.clk(clk),
			.reset(reset), 
			.max_tick(s_tick)
	    );

	UART_Receive rcx(
			.clk(clk), 
			.reset(reset),
			.rx(rx), 
			.s_tick(s_tick), 
			.dout(rx_out), 
			.rx_done_tick(rx_done_tick)
	);
	
	
	UART_Transmit tsx (
			.clk(clk), 
			.reset(reset), 
			.tx_start(tx_start), 
			.s_tick(s_tick), 
			.din(tx_in), 
			.tx_done_tick(tx_done_tick), 
			.tx(tx)
		);

endmodule
