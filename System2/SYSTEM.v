`timescale 1ns / 1ps
module SYSTEM(clk
    );
	 
input clk;

wire [7:0] RAM_address;
wire [15:0] data;
//output [20:0] Main_Control_Signal;

wire [15:0] C_Bus;
//Bus Connections
wire [15:0] MDR_B_Bus;
wire [7:0] MAR_B_Bus;
wire [7:0] PC_B_Bus;
wire [15:0] GP_B_Bus;
wire [15:0] B_Bus_Con;
wire [15:0] GP_Bus_Con;
wire [15:0] IR_Bus_Con;
wire [7:0] PC_Bus_Con;
wire [15:0] A_Bus;

//ROM
wire [7:0] ROM_Data;
wire [7:0] ROM_Address;

//Control Signal

wire [2:0] ram_control_signal;
wire [2:0] mdr_control_signal;
wire [4:0] C_Bus_CU;
wire [4:0] B_Bus_CU;
wire [2:0] DATA_Con_CU;
wire [3:0] ALU_CU;
wire [2:0] Reg_Inc_CU;
wire [7:0] IR_Input;
wire [15:0] IR_Input2;
wire flag;
wire IR_Load;

//RAM & MDR CU

assign ram_control_signal[2]=DATA_Con_CU[2];
assign ram_control_signal[1]=DATA_Con_CU[1];
assign ram_control_signal[0]=DATA_Con_CU[0];
assign mdr_control_signal[1]=DATA_Con_CU[0];
assign mdr_control_signal[0]=DATA_Con_CU[1];
assign mdr_control_signal[2]=C_Bus_CU[3];


//Register Bit Convert
wire [15:0] MAR_B_BUS2;	
Bit8_Bit16 MAR_Output_Covnerter(
										.input8(MAR_B_Bus),
										.output16(MAR_B_BUS2)
										);
										
wire [15:0] PC_B_BUS2;	
Bit8_Bit16 PC_Output_Covnerter(
										.input8(PC_Bus_Con),
										.output16(PC_B_BUS2)
										);		
										
wire [7:0] IR_B_BUS2;	
Bit8_Bit16 IR_Output_Covnerter(
										.input8(IR_B_BUS2),
										.output16(IR_Input2)
										);		
/////////////////////////////////////////

wire [7:0] C_Bus_Con;
Bit16_Bit8 Input_Covnerter(
			.input16(C_Bus),
			.output8(C_Bus_Con)
    );										


RAM RAM(
	.clk(clk),
	.address(RAM_address),
	.data(data),
	.control_signal(ram_control_signal)
    );
	 

MDR_Register MDR_Register(
	.Clk(clk),
	.reg_input(C_Bus),
	.RAM_data(data),
	.reg_inc(Reg_Inc_CU[2]),
	.control_signal(mdr_control_signal),
	.MDR_data(MDR_B_Bus)
	
    );
	 
MAR_Register MAR_Register(
		.reg_input(C_Bus_Con),
		.Clk(clk),
		.reg_load(C_Bus_CU[4]),
		.MAR_address(MAR_B_Bus),
		.reg_inc(Reg_Inc_CU[1]),
		.RAM_address(RAM_address)
    );
	 
B_Bus B_Bus(
		.MAR_input(MAR_B_BUS2),
		.MDR_input(MDR_B_Bus),
		.PC_input(PC_B_BUS2),
		.GP_input(GP_Bus_Con),
		.IR_input(IR_Input2),
		.data_output(B_Bus_Con),
		.control_signal(B_Bus_CU)
		);
ALU ALU(
		.A_Bus(A_Bus),
		.B_Bus(B_Bus_Con),
		.Z_flag(flag),
		.control_signal(ALU_CU),
		.C_Bus(C_Bus)
    );
	 
GP_Register GP_Register(
			.reg_input(C_Bus),
			.Clk(clk),
			.GP_data(GP_Bus_Con),
			.reg_load(C_Bus_CU[1])
		);
		
IR_Register IR_Register(
			.reg_input(ROM_Data),
			.Clk(clk),
			.GP_data(IR_Input),
			.reg_load(IR_Load),
			.B_Bus_Data(IR_B_BUS2)
		);
		
AC_Register AC_Register(
			.reg_input(C_Bus),
			.Clk(clk),
			.AC_data(A_Bus),
			.reg_load(C_Bus_CU[0])
		);
		
ROM ROM(.ROM_address(ROM_Address),
		  .ROM_data(ROM_Data)
    );
	 
PC_Register PC_Register(
	.reg_input(C_Bus_Con),
	.Clk(clk),
	.reg_load(C_Bus_CU[2]),
	.PC_address(PC_Bus_Con),
	.reg_inc(Reg_Inc_CU[0]),
	.ROM_address(ROM_Address)
    );
	 
CU CU(.clk(clk),
			 .C_Bus_CU(C_Bus_CU),
			 .B_Bus_CU(B_Bus_CU),
			 .DATA_Con_CU(DATA_Con_CU),
			 .ALU_CU(ALU_CU),
			 .Reg_Inc_CU(Reg_Inc_CU),
			 .IR_Input(IR_Input),
			 .IR_Load(IR_Load),
			 .flag(flag)
    );
	
endmodule
