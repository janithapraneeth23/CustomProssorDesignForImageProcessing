`timescale 1ns / 1ps

module MDR_Register(
 reg_input,
 Clk,
 MDR_data,
 reg_inc,
 RAM_data_in,
 RAM_data_out,
 control_signal


    );
//B & C bus
input [15:0] reg_input;
input Clk;
output [15:0] MDR_data;
input reg_inc;
reg [15:0] MDR_data;

//RAM 
input [15:0] RAM_data_in;
output [15:0] RAM_data_out;
//control signal
input [2:0] control_signal;

wire reg_load; //bus
wire reg_ram_load; 
wire reg_load_ram;

assign reg_load = control_signal[2];
assign reg_ram_load = control_signal[1];
assign reg_load_ram = control_signal[0];

assign RAM_data_out =  reg_load_ram ? MDR_data :16'bx;


always @(posedge Clk)
		begin
			if (reg_load)
				begin
					MDR_data <=reg_input;
				end
			else if(reg_inc)
					begin
						MDR_data <= MDR_data+8'b1;
					end
			else if(reg_ram_load)
					begin
						MDR_data <= RAM_data_in;
					end
		end

endmodule
