`timescale 1ns / 1ps

module Registers(
	input clk,
	input M_write,
	input M_read,
	input [15:0] DATA_BUS_in,
	output [15:0] DATA_BUS_out,
	output [15:0] DATA_ADDRESS_BUS,
   output [7:0] INS_ADDRESS_BUS,
	input [7:0] INS_BUS,
	input [15:0] C_BUS,
	output [15:0] A_BUS,
	output [15:0] B_BUS,
	output [7:0] CNT_OUT,
	input [5:0] SET_sig,
	input [2:0] B_MUX_sig,
	input [2:0] REG_INC,
	output Z_Flag_Out,
	input Control_Signal_Z
	);
	
wire[15:0] PC_w,IR_w,MDR_w,MAR_w,GP_w,GP_w2;
wire [2:0] mdr_control_signal;
wire Z_Flag;

assign mdr_control_signal[2] = SET_sig[3];
assign mdr_control_signal[1] = M_read;
assign mdr_control_signal[0] = M_write;
wire [15:0] IR_w2;

assign IR_w2[15:8] = 8'b0;
assign IR_w2[7:0] = IR_w;

PC_Register PC_Register(C_BUS,clk,SET_sig[2],PC_w,REG_INC[0],INS_ADDRESS_BUS);
IR_Register IR_Register(INS_BUS,clk,CNT_OUT,IR_w);

MDR_Register MDR_Register(C_BUS,clk,MDR_w,REG_INC[2],DATA_BUS_in,DATA_BUS_out,mdr_control_signal);

GP_Register GP_Register(C_BUS,clk,GP_w,SET_sig[1]);
GP_Register GP_Register2(C_BUS,clk,GP_w2,SET_sig[5]);
AC_Register AC_Register(C_BUS,clk,A_BUS,SET_sig[0],Z_Flag);

MAR_Register MAR_Register(C_BUS,clk,SET_sig[4],MAR_w,REG_INC[1],DATA_ADDRESS_BUS);

B_bus_MUX B_bus_MUX(PC_w,MDR_w,MAR_w,IR_w2,GP_w,GP_w2,B_MUX_sig,B_BUS);

Z_Flag Z_Flag_Mod(Z_Flag,Z_Flag_Out,Control_Signal_Z);

endmodule
