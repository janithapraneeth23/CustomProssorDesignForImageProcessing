`timescale 1ns / 1ps

module TEST;

	// Inputs
	reg clk;

	// Outputs
	reg [20:0] Main_Control_Signal;

	// Instantiate the Unit Under Test (UUT)
	SYSTEM uut (
		.clk(clk)
	);
	always #(10/2) clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		//Main_Control_Signal=21'b00000000000000000000;
		//#10 Main_Control_Signal=21'b000000010000000000000;
		//#10 Main_Control_Signal=21'b000000000000000000001;
		//#10 Main_Control_Signal=21'b100000001000000110000;
		//#10 Main_Control_Signal=21'b000000000000000001010;
		//#10 Main_Control_Signal=21'b000010000010000110000;
		
	
	end
      
endmodule

