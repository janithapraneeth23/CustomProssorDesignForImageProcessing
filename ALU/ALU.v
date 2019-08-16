`timescale 1ns / 1ps

module ALU(
		A_Bus,
		B_Bus,
		control_signal,
		C_Bus
    );

input [15:0] A_Bus;
input [15:0] B_Bus;
output reg[15:0] C_Bus;
input [3:0] control_signal;

always @(control_signal,B_Bus,A_Bus)
	begin
		case(control_signal)
			4'b0000:
				begin
						C_Bus=16'bx;
				end
				
			4'b0001:
				begin
				C_Bus=16'b0;
				end
			
			4'b0010:
				begin
						C_Bus=A_Bus;
				end
				
			4'b0011:
				begin
						C_Bus=B_Bus;
				end
				
			4'b0100:
				begin
						C_Bus=A_Bus+B_Bus;
				end
				
			4'b0101:
				begin
						C_Bus=A_Bus-B_Bus;
				end
			
			
			4'b0110:
				begin
						C_Bus=A_Bus>>2;
				end
				
			4'b0111:
				begin
						C_Bus=A_Bus>>1;

				end
			
			4'b1000:
				begin
						C_Bus=A_Bus-16'b0000000000000001;

				end
			4'b1001:
				begin
						C_Bus=B_Bus-16'b0000000000000001;
				end
				
			4'b1010:
				begin
						C_Bus=A_Bus+16'b0000000000000001;
				end
				
			4'b1011:
				begin
						C_Bus=B_Bus<<8;
				end
			4'b1100:
				begin
						C_Bus=A_Bus<<8;
				end
			default:
				begin
					C_Bus=16'bx;
				end
		endcase
	end


endmodule
