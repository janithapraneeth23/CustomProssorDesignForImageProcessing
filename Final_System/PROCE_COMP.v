`timescale 1ns / 1ps
module PROCE_COMP(RAM_IN,RAM_OUT,select,clk);
	 input clk;
	 input [15:0]RAM_IN;
	 output [15:0]RAM_OUT;
	 input select;
	 
	 wire clk_insert;
	 and(clk_insert,select,clk);
	 wire [15:0] RAM_ADDRESS;
	 wire [15:0] DATA_BUS_in;
	 wire [15:0] DATA_BUS_out;
	 wire M_Read;
	 wire M_Write;
	 wire RAM_en;
	 wire [1:0] control_signal;
	 wire End_of_process;
	
assign RAM_IN = DATA_BUS_in;
assign RAM_OUT = DATA_BUS_out;
//assign control_signal[0]=M_Read;
assign control_signal[0]=M_Write;
assign control_signal[1]=RAM_en;

//assign RAM_Data_out=DATA_BUS_out;
//assign RAM_Address_out=RAM_ADDRESS;

RAM DATA_MEMORY(clk,RAM_ADDRESS,DATA_BUS_in,DATA_BUS_out,control_signal);

P2Processor Processor(clk_insert,RAM_ADDRESS,DATA_BUS_out,DATA_BUS_in,M_Write,RAM_en,End_of_process);

endmodule
