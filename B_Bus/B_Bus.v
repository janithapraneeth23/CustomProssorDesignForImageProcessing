`timescale 1ns / 1ps

module B_Bus(
		MAR_input,
		MDR_input,
		PC_input,
		GP_input,
		IR_input,
		data_output,
		control_signal

    );


input [15:0] MAR_input;
input [15:0] PC_input;
input [15:0] MDR_input;
input [15:0] GP_input;
input [15:0] IR_input;
input [4:0] control_signal;

output reg [15:0] data_output;

always @(control_signal,IR_input,MAR_input,PC_input,MDR_input,GP_input)
	begin
		case(control_signal)
			5'b01000:data_output<=MAR_input;
			5'b00010:data_output<=PC_input;
			5'b00100:data_output<=MDR_input;
			5'b00001:data_output<=GP_input;
			5'b10000:data_output<=IR_input;
			default:data_output<=16'bz;
		endcase
	end

endmodule
