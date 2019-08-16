`timescale 1ns / 1ps
module PC_Register(
	input [7:0] reg_input,
	input Clk,
	input reg_load,
	output reg [7:0] PC_address,
	input reg_inc,
	output [7:0] ROM_address
    );

	 
	assign ROM_address = PC_address;
	
	always @(posedge Clk)
		begin
			if (reg_load)
				begin
					PC_address =reg_input;
				end
			else if(reg_inc)
					begin
						PC_address = PC_address+8'b1;
					end
		end
		
	initial
		begin
		PC_address=8'b0;
		end
endmodule
