`timescale 1ns / 1ps

module clkReal(
    input [0:0] clk,
    input active,
    output reg system_clk
    );
		 


		//if you want to divide clock
		reg [31:0] clk_counter = 32'd0;
		always @(posedge clk) begin
				if (~active)
				begin
					system_clk = 1'd0;
				end
				else 
				begin
					if(clk_counter == 32'd100) 
					begin
						system_clk = ~system_clk;
						clk_counter = 16'd0;
					end
					else begin
						clk_counter = clk_counter+1'd1;
					end
				end
		end
endmodule
