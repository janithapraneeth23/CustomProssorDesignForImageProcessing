`timescale 1ns / 1ps

module RAM_MUX_DATA(RAM_OUT,UART_IN,PROC_IN,sel);
	inout [15:0] RAM_OUT;
	inout [15:0] UART_IN;
	inout [15:0] PROC_IN;
	input sel;
	
	wire UART_IN;
	wire PROC_IN;
	
	assign RAM_OUT =  sel ? UART_IN : PROC_IN;	
	always @(*)
		begin
			if (sel)
				begin
					UART_IN=RAM_OUT;
				end
			else
				begin 
					PROC_IN=RAM_OUT;
				end
		end

	
endmodule
