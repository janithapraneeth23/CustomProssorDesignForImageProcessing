`timescale 1ns / 1ps

module IR_Register(
			reg_input,
			Clk,
			GP_data,
			B_Bus_Data
    );
	 
input [7:0] reg_input;
input Clk;
output reg [7:0] GP_data;
output [7:0] B_Bus_Data;

assign B_Bus_Data=GP_data;


always @(posedge Clk)
		begin
			GP_data=reg_input;
		end
initial
		begin
		GP_data=8'b0;
		end


endmodule
