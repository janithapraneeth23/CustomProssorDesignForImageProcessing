`timescale 1ns / 1ps

module Test;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	PROCE_COMP uut (
		.clk(clk)
	);

	 always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
	end
      
endmodule

