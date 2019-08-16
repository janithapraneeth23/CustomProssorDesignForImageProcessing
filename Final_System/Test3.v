`timescale 1ns / 1ps


module Test3;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	PROCE_COMP uut (
		.clk(clk)
	);
always #5 clk=~clk;
	initial begin
		clk = 0;
		#100;
	end
      
endmodule

