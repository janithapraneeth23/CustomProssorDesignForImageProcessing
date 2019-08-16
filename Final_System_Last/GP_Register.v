`timescale 1ns / 1ps

module GP_Register(
			reg_input,
			Clk,
			GP_data,
			reg_load
    );
	 
input [15:0] reg_input;
input Clk;
output reg [15:0] GP_data;
input reg_load;

always @(posedge Clk)
		begin
			if (reg_load)
				begin
					GP_data <=reg_input;
				end
		end
initial
		begin
		GP_data=16'b0;
		end


endmodule
