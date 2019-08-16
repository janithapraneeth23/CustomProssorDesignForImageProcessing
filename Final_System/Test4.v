`timescale 1ns / 1ps

module Test4;

	// Inputs
	reg RAM_IN;
	reg select;
	reg clk;

	// Outputs
	wire RAM_OUT;

	// Instantiate the Unit Under Test (UUT)
	PROCE_COMP uut (
		.RAM_IN(RAM_IN), 
		.RAM_OUT(RAM_OUT), 
		.select(select), 
		.clk(clk)
	);
always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		RAM_IN = 0;
		select = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

