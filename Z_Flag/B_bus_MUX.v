`timescale 1ns / 1ps

module B_bus_MUX(
	 input [15:0] PC,
    input [15:0] MDR,
    input [15:0] MAR,
	 input [15:0] IR,
    input [15:0] GP,
	 input [15:0] GP2,
    input [2:0] M,
    output reg [15:0] B_bus
    );

	always @(*) begin
		case(M)
			3'b000 : B_bus <=  16'bx;
			3'b001 : B_bus <= GP;
			3'b010 : B_bus <= PC;
			3'b011 : B_bus <= GP2;
			3'b100 : B_bus <= MDR;
			3'b101 : B_bus <= MAR;
			3'b110 : B_bus <= IR;
			3'b111 : B_bus <=  16'bx;
			default:	  B_bus <= 16'bx;
		endcase
	end
endmodule
