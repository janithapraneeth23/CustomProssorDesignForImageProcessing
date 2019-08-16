`timescale 1ns / 1ps

module MPC(IR,Addr,MPC,JMPC
    );
	
	input [7:0] IR;
	input [7:0] Addr;
	output reg [7:0] MPC;
	input JMPC;
	
	initial begin 
		MPC = 8'b0;
	end
	always @(*) 
		begin
			if(JMPC)
				MPC = IR;
			else if(~JMPC)
				MPC = Addr;
		end
		
endmodule
