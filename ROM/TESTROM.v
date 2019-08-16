`timescale 1ns / 1ps


module TESTROM;

	// Inputs
	reg [2:0] ROM_address;

	// Outputs
	wire [7:0] ROM_data;
	reg [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	ROM uut (
		.ROM_address(ROM_address), 
		.ROM_data(ROM_data)
	);

	initial begin
		// Initialize Inputs
		#5 ROM_address=2'b01;
		 data_out=ROM_data;
		#5 ROM_address=2'b11;
		
	end
      
endmodule

