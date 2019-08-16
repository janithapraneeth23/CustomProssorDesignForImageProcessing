`timescale 1ns / 1ps

module P2Processor(clk,RAM_ADDRESS,DATA_BUS_in,DATA_BUS_out,M_Write,RAM_en,End_of_process,INS_ADDRESS_out);

	input clk;
	output [15:0] RAM_ADDRESS;
	output M_Write,RAM_en;
	output End_of_process;
	output [7:0] INS_ADDRESS_out;
	
	input [15:0] DATA_BUS_in;
	output [15:0] DATA_BUS_out;
	
	wire [7:0]INS_ADDRESS;
	wire [7:0]INS_BUS;
	wire End_of_process;
	assign INS_ADDRESS_out=INS_BUS;
	
	ROM ROM(INS_ADDRESS,INS_BUS);
	P1Processor P1Processor(INS_BUS,INS_ADDRESS,DATA_BUS_in,DATA_BUS_out,RAM_ADDRESS,M_Write,clk,RAM_en,End_of_process); 
endmodule
