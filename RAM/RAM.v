`timescale 1ns / 1ps
module RAM(
	clk,
	address,
	data_in,
	data_out_port,
	control_signal
    );
input clk;
input [15:0] address;
	 
input [1:0] control_signal;

//Input and Output for data Ports

input [15:0] data_in;
output [15:0] data_out_port;
	 
	assign chip_select =control_signal[1]; 
	assign write_enable=control_signal[0];
	//assign output_enable=control_signal[0];
	 
RAM_BLOCK RAM_BLOCK (
  .clka(clk), // input clka
  .ena(chip_select), // input ena
  .wea(write_enable), // input [0 : 0] wea
  .addra(address), // input [15 : 0] addra
  .dina(data_in), // input [15 : 0] dina
  .douta(data_out_port) // output [15 : 0] douta
);

/*parameter DATA_WIDTH = 16 ;
parameter ADDR_WIDTH = 14 ;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

//Input Ports

input clk;
input [15:0] address;
input [2:0] control_signal;

//Input and Output for data Ports

input [DATA_WIDTH-1:0] data_in;
output [DATA_WIDTH-1:0] data_out_port;

//Internal Variables
wire chip_select;
wire write_enable;
wire output_enable;
wire [13:0] address2;
reg [DATA_WIDTH-1:0] data_out;
reg [1:0] mem2;
reg [DATA_WIDTH-1:0] mem [RAM_DEPTH-1:0];

	assign address2[13:0] = address[13:0];
	assign chip_select =control_signal[2]; 
	assign write_enable=control_signal[1];
	assign output_enable=control_signal[0];

assign data_out_port = data_out;
always @ (posedge clk)
	begin: MEM_WRITE
		if(chip_select && write_enable)
			begin
				mem[address2] = data_in;
				mem2 = address[15:14];
			end
end

always @ (posedge clk)
	begin:MEM_READ
		if(chip_select && !write_enable && output_enable)
			begin
				data_out = mem[address2];
			end
end
		//Initial Data
		//height
		initial	mem[0] = 16'b00000000_00001100;
		//width
		initial	mem[1] = 16'b00000000_00000101;
		//picture size
		initial	mem[2] = 16'b00000000_00011001;
		//image start point
		initial	mem[3] = 16'b00000000_00010000;
		
		
		//variable data
		initial	mem[4] = 16'b00000000_00000000;
		initial	mem[5] = 16'b00000000_00000000;
		initial	mem[6] = 16'b00000000_00000000;
		initial	mem[7] = 16'b00000000_00000000;
		initial	mem[8] = 16'b00000000_00000000;
		initial	mem[9] = 16'b00000000_00000000;
		initial	mem[10] = 16'b00000000_00000000;
		initial	mem[11] = 16'b00000000_00000000;
		initial	mem[12] = 16'b00000000_00000000;
		initial	mem[13] = 16'b00000000_00000000;
		initial	mem[14] = 16'b00000000_00000000;
		initial	mem[15] = 16'b00000000_00000000;
		
		//Image 5*5
		initial	mem[16] = 16'b00000000_11111111;
		initial	mem[17] = 16'b00000000_11101010;
		initial	mem[18] = 16'b00000000_11001100;
		initial	mem[19] = 16'b00000000_10100101;
		initial	mem[20] = 16'b00000000_01111111;
		initial	mem[21] = 16'b00000000_11101010;
		initial	mem[22] = 16'b00000000_11001100;
		initial	mem[23] = 16'b00000000_10100101;
		initial	mem[24] = 16'b00000000_01111111;
		initial	mem[25] = 16'b00000000_01011001;
		initial	mem[26] = 16'b00000000_11001100;
		initial	mem[27] = 16'b00000000_10100101;
		initial	mem[28] = 16'b00000000_01111111;
		initial	mem[29] = 16'b00000000_01011001;
		initial	mem[30] = 16'b00000000_00110011;
		initial	mem[31] = 16'b00000000_10100101;
		initial	mem[32] = 16'b00000000_01111111;
		initial	mem[33] = 16'b00000000_01011001;
		initial	mem[34] = 16'b00000000_00110011;
		initial	mem[35] = 16'b00000000_00010100;
		initial	mem[36] = 16'b00000000_01111111;
		initial	mem[37] = 16'b00000000_01011001;
		initial	mem[38] = 16'b00000000_00110011;
		initial	mem[39] = 16'b00000000_00010100;
		initial	mem[40] = 16'b00000000_00000000;*/
		
		
endmodule
