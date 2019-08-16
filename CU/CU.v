`timescale 1ns / 1ps


module CU(clk,
			 C_Bus_CU,
			 B_Bus_CU,
			 DATA_Con_CU,
			 ALU_CU,
			 Reg_Inc_CU,
			 IR_Input,
			 IR_Load,
			 flag
			 
    );

output [4:0] C_Bus_CU;
output [4:0] B_Bus_CU;
output [2:0] DATA_Con_CU;
output [3:0] ALU_CU;
output [2:0] Reg_Inc_CU;
output IR_Load;

input [7:0] IR_Input;
input flag;
input clk;

reg [20:0] Main_Control_Signal;

//assign Control Signal
assign C_Bus_CU[4] = Main_Control_Signal[20];
assign C_Bus_CU[3] = Main_Control_Signal[19];
assign C_Bus_CU[2] = Main_Control_Signal[18];
assign C_Bus_CU[1] = Main_Control_Signal[17];
assign C_Bus_CU[0] = Main_Control_Signal[16];

assign Reg_Inc_CU[2] = Main_Control_Signal[15];
assign Reg_Inc_CU[1] = Main_Control_Signal[14];
assign Reg_Inc_CU[0] = Main_Control_Signal[13];

assign B_Bus_CU[4] = Main_Control_Signal[12];
assign B_Bus_CU[3] = Main_Control_Signal[11];
assign B_Bus_CU[2] = Main_Control_Signal[10];
assign B_Bus_CU[1] = Main_Control_Signal[9];
assign B_Bus_CU[0] = Main_Control_Signal[8];

assign ALU_CU[3] = Main_Control_Signal[7];
assign ALU_CU[2] = Main_Control_Signal[6];
assign ALU_CU[1] = Main_Control_Signal[5];
assign ALU_CU[0] = Main_Control_Signal[4];

assign DATA_Con_CU[2] = Main_Control_Signal[3];
assign DATA_Con_CU[1] = Main_Control_Signal[2];
assign DATA_Con_CU[0] = Main_Control_Signal[1];

assign IR_Load = Main_Control_Signal[0];

initial begin

 Main_Control_Signal = 21'b1;
end
endmodule
