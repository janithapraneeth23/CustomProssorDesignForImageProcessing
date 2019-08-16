`timescale 1ns / 1ps
module ALU_REG(INS_BUS,
					clk,
					C_Control,
					B_Control,
					REG_INC,
					M,
					ALU_sig,
					CNT_OUT,
					RAM_ADDRESS,
					INS_ADDRESS,
					Z,
					DATA_BUS_in,
					DATA_BUS_out,
					Control_Signal_Z);

	input [7:0] INS_BUS;
	input clk;
	input [5:0] C_Control;
	input [2:0] B_Control;
	input [2:0] REG_INC;
	input [1:0] M;
	input [3:0] ALU_sig;
	input Control_Signal_Z;
	
	output [7:0] CNT_OUT;
	output [15:0] RAM_ADDRESS;
	output [7:0] INS_ADDRESS;
	output Z;
	
	input [15:0] DATA_BUS_in;
	output [15:0] DATA_BUS_out;
	
	wire [15:0] C_BUS,A_BUS,B_BUS;
	
	ALU ALU(A_BUS,B_BUS,ALU_sig,C_BUS);	
	Registers Registers(clk,M[1],M[0],DATA_BUS_in,DATA_BUS_out,RAM_ADDRESS,INS_ADDRESS,INS_BUS,C_BUS,A_BUS,B_BUS,CNT_OUT,C_Control,B_Control,REG_INC,Z,Control_Signal_Z);

endmodule
