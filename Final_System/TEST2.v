`timescale 1ns / 1ps
module TEST2;

	// Inputs
	reg clk_insert;
	reg [7:0] RAM_Address_out;
	//reg Pro_Select;

	// Bidirs
	wire [15:0] RAM_Data_out;
	reg [15:0] RAM_Data_out2;
	reg Pro_Select;

	// Instantiate the Unit Under Test (UUT)
	PROCE_COMP uut (
		.clk(clk_insert), 
	);
	
	 always #5 clk_insert=~clk_insert;
	initial begin
		// Initialize Inputs		
		
		#125 Pro_Select=1;

		// Wait 100 ns for global reset to finish
		#100;
        
	end
      
endmodule

