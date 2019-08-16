`timescale 1ns / 1ps

module Z_Flag(
	 input [0:0] Z_Flag_In,
    output reg [0:0] Z_Flag_Out,
    input [0:0] Control_Signal
    );

		always @(*) begin
				if(Control_Signal)
					begin
						Z_Flag_Out<=Z_Flag_In;
					end
				else
				begin
					 Z_Flag_Out<=1'b0;
				end
				
			end
endmodule
