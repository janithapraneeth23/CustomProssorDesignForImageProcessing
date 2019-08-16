`timescale 1ns / 1ps

module Bit16_Bit8(
			input16,
			output8
    );
	 
input [15:0] input16;
output [7:0] output8;

assign output8[7] = input16[7];
assign output8[6] = input16[6];
assign output8[5] = input16[5];
assign output8[4] = input16[4];
assign output8[3] = input16[3];
assign output8[2] = input16[2];
assign output8[1] = input16[1];
assign output8[0] = input16[0];



endmodule
