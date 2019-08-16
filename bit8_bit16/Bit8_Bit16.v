`timescale 1ns / 1ps

module Bit8_Bit16(
			input8,
			output16
    );


input [7:0] input8;
output [15:0] output16;

assign output16[15] = 0;
assign output16[14] = 0;
assign output16[13] = 0;
assign output16[12] = 0;
assign output16[11] = 0;
assign output16[10] = 0;
assign output16[9] = 0;
assign output16[8] = 0;
assign output16[7] = input8[7];
assign output16[6] = input8[6];
assign output16[5] = input8[5];
assign output16[4] = input8[4];
assign output16[3] = input8[3];
assign output16[2] = input8[2];
assign output16[1] = input8[1];
assign output16[0] = input8[0];

endmodule
