`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:53:12 07/28/2016
// Design Name:   ControlUnit
// Module Name:   D:/CPU/Users/Control_Unit/test.v
// Project Name:  Control_Unit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg Z;
	reg [7:0] MPC;
	reg clk;

	// Outputs
	wire RAM_en;
	wire [2:0] REG_INC;
	wire [7:0] Addr;
	wire JMPC;
	wire [3:0] ALU;
	wire [4:0] C;
	wire [4:0] B;
	wire [1:0] M;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.RAM_en(RAM_en), 
		.REG_INC(REG_INC), 
		.Z(Z), 
		.MPC(MPC), 
		.clk(clk), 
		.Addr(Addr), 
		.JMPC(JMPC), 
		.ALU(ALU), 
		.C(C), 
		.B(B), 
		.M(M)
	);

	initial begin
		// Initialize Inputs
		Z = 0;
		MPC = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

