`timescale 1ns / 1ps
module MAR_Register(
		input [15:0] reg_input,
		input Clk,
		input reg_load,
		output reg [15:0] MAR_address,
		input reg_inc,
		output [15:0] RAM_address
    );

	assign RAM_address = MAR_address;

	
	always @(posedge Clk)
		begin
			if (reg_load)
				begin
					MAR_address <=reg_input;
				end
			else if(reg_inc)
					begin
						MAR_address <= MAR_address+16'b1;
					end
		end
		
	initial
		begin
		MAR_address=16'b0;
		end



endmodule
