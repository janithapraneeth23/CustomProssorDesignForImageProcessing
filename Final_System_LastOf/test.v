`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:20:56 08/26/2016
// Design Name:   Top
// Module Name:   D:/CPU/Users/Final_System_LastOf/test.v
// Project Name:  Final_System_LastOf
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
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
	reg clk;
	reg PC_RAM_ACT;
	reg RAM_PC_ACT;
	reg PROCESS_ACT;
	reg IDLE_ACT;
	reg reset;
	reg rx;

	// Outputs
	wire tx;
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clk(clk), 
		.PC_RAM_ACT(PC_RAM_ACT), 
		.RAM_PC_ACT(RAM_PC_ACT), 
		.PROCESS_ACT(PROCESS_ACT), 
		.IDLE_ACT(IDLE_ACT), 
		.reset(reset), 
		.rx(rx), 
		.tx(tx), 
		.led(led)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		PC_RAM_ACT = 0;
		RAM_PC_ACT = 0;
		PROCESS_ACT = 0;
		IDLE_ACT = 0;
		reset = 0;
		rx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

