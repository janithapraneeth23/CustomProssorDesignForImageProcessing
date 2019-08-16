`timescale 1ns / 1ps

module RAMCHCEK;

// Inputs
	reg [7:0] address;
	reg clk;
	reg [2:0] control_signal;
	reg [15:0] data2;

	// Outputs
	wire [15:0] data;

	// Instantiate the Unit Under Test (UUT)
	RAM uut (
		.clk(clk), 
		.address(address), 
		.data(data), 
		.control_signal(control_signal)
	);
	
	always #5 clk = ~clk; 
	assign data = control_signal[1] ? data2 : 16'bz;
	initial begin 
		clk = 1'b0;
		#5 address=8'b00000001;
		#15 control_signal=3'b110;
			 data2=16'b11000000;
		#10 control_signal=3'b101;		
	end
	      
endmodule

