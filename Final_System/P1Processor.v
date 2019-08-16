`timescale 1ns / 1ps
module P1Processor(INS_BUS,
						 INS_ADDRESS,
						 DATA_BUS_in,
						 DATA_BUS_out,
						 RAM_ADDRESS,
						 M_Write,
						 clk,
						 RAM_en,
						 End_of_process
);
	input [7:0] INS_BUS;
	input clk;
	
	output [15:0] RAM_ADDRESS;
	output M_Write;
	output [7:0] INS_ADDRESS;
	output RAM_en;
	output End_of_process;

	
	input [15:0] DATA_BUS_in;
	output [15:0] DATA_BUS_out;
	
	wire [7:0] MPC_Data;
	wire JMPC;
	wire [5:0] C;
	wire [2:0] B;
	wire [2:0] REG_INC;
	wire [1:0]M;
	wire [3:0] ALU;
	wire [7:0]CNT_OUT;
	wire Z;
	wire [7:0] Addr;
	wire Control_Signal_Z;
	wire End_of_process;
	
	assign M_Write = M[1];
	ALU_REG ALU_REG(INS_BUS,clk,C,B,REG_INC,M,ALU,CNT_OUT,RAM_ADDRESS,INS_ADDRESS,Z,DATA_BUS_in,DATA_BUS_out,Control_Signal_Z);				
	ControlUnit ControlUnit(Control_Signal_Z,RAM_en,REG_INC,Z,MPC_Data,clk,Addr,JMPC,ALU,C,B,M,End_of_process);
	MPC MPC(CNT_OUT,Addr,MPC_Data,JMPC);
	
	
endmodule
