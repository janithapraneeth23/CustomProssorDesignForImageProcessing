`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:44:07 06/20/2016
// Design Name:   StateMachine
// Module Name:   D:/CPU/Users/StateMachine/Test.v
// Project Name:  StateMachine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StateMachine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test;

	// Inputs
	reg clock;
	reg reset;
	reg req_0;
	reg req_1;

	// Outputs
	wire gnt_0;
	wire gnt_1;

	// Instantiate the Unit Under Test (UUT)
	StateMachine uut (
		.clock(clock), 
		.reset(reset), 
		.req_0(req_0), 
		.req_1(req_1), 
		.gnt_0(gnt_0), 
		.gnt_1(gnt_1)
	);

always #(5) clock = ~clock;

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		req_0 = 0;
		req_1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

