`timescale 1ns / 1ps

module Z_Flag(
   
    );

	

always @(*) begin
		case(M)
			3'b000 : B_bus <= B_bus;
			3'b001 : B_bus <= GP;
			3'b010 : B_bus <= PC;
			3'b011 : B_bus <= GP2;
			3'b100 : B_bus <= MDR;
			3'b101 : B_bus <= MAR;
			3'b110 : B_bus <= IR;
			3'b111 : B_bus <=  16'bz;
			default:	  B_bus <= 16'bz;
		endcase
	end
endmodule
