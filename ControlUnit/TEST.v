`timescale 1ns / 1ps

module TEST;

	// Inputs
	reg clk;
	reg [7:0] IR_Input;

	// Outputs
	wire [20:0] Main_Control_Signal;

	// Instantiate the Unit Under Test (UUT)
	CU uut (
		.clk(clk), 
		.IR_Input(IR_Input), 
		.Main_Control_Signal(Main_Control_Signal)
	);
	
	always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		#100
		clk = 0;
		IR_Input = 8'b00000001;	


	end
      
endmodule

