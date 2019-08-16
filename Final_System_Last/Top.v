`timescale 1ns / 1ps

module Top
	(clk,
	 //Switches
	 PC_RAM_ACT,
	 RAM_PC_ACT,
	 PROCESS_ACT,
	 IDLE_ACT,
	 reset,
	 
	 rx,
	 tx,
	 led
    );
	 parameter ram_read_len=16'd16384;
	 input clk;
	 //Switches
	 input PC_RAM_ACT;
	 input RAM_PC_ACT;
	 input PROCESS_ACT;
	 input IDLE_ACT;
	 input reset;
	 wire [15:0]DATA_BUS_in;
	 output tx;
	 
	 input rx;
	 
	 output reg [7:0] led;
	 wire DB_Out_PC_RAM,DB_Out_RAM_PC,DB_Out_PROCESS,DB_Out_IDLE;
	 wire [7:0] rx_out;
	 reg tx_start;
	 reg [7:0] tx_in;
	 reg [15:0] address_temp,address_temp2;
	 
	 reg clk_insert_active;
	 
	 localparam [1:0]
		idle = 2'b00,
		pc_to_ram = 2'b01,
		process = 2'b10,
		ram_to_pc = 2'b11;
		
	 reg [1:0] state_reg;
	 
	 initial
	 begin
		led<=8'b1111111;
		address_temp<=16'd0;
		address_temp2<=16'd0;
		clk_insert_active<=1'b0;
		
		
	 
	 end 
	 
	 
	 
	 
	 //State Changing Process and Result Out
	 always@(posedge clk)
	 begin
	
		// Stage Changer
		if(DB_Out_PC_RAM)
		begin
			state_reg<=pc_to_ram;
		end
		if(DB_Out_RAM_PC)
		begin
			state_reg<=ram_to_pc;
		end
		if(DB_Out_PROCESS)
		begin
			state_reg<=process;
		end
		if(DB_Out_IDLE)
		begin
			state_reg<=idle;
		end
		//state fuctions
		if(state_reg==pc_to_ram)
		begin
			if(rx_done_tick && address_temp<ram_read_len) begin
				 address_temp<=address_temp+16'd1;
				 led<=8'b11110000;
			 end
			 
			 if(rx_done_tick && address_temp==ram_read_len) begin
				 led<=8'b00001111;
				 address_temp<=16'd0;
				 state_reg<=idle;
			 end
		end
		
		if(state_reg==ram_to_pc)
		begin
		    if(tx_start && tx_done_tick && address_temp2<ram_read_len) begin
				 address_temp2<=address_temp2+16'd1;
				 led<=8'b00001111;
			 end
			 
			 else if(tx_start && tx_done_tick && address_temp2==ram_read_len) begin
				 address_temp2<=16'd0;
			    led<=8'b11110000;
				 state_reg<=idle;
			 end
		end
		
		if(state_reg==process)
		begin
			if(End_of_process) begin
				 led<=8'b10101010;
				 state_reg<=idle;
			end
			else
			begin
				led<=RAM_ADDRESS_ALU;
			end
			
		end
		if(state_reg==idle)
		begin
			led<=8'b10000000;
		end
		
	 end
	 
	 always @*
	 begin
		case(state_reg)
			idle:
			begin
			end
			
			pc_to_ram:
			begin
				RAM_ADDRESS<=address_temp;
				RAM_DATA_in<=rx_out;
				RAM_en<=1'b1;
				M_Write<=1'b1;
				tx_start<=1'b0;
				tx_in<=8'b0;
				clk_insert_active<=1'b0;
				
			end
			
			process:
			begin
			
				RAM_ADDRESS<=RAM_ADDRESS_ALU;
				DATA_BUS_out<=RAM_DATA_out;
				RAM_DATA_in<=DATA_BUS_in;
				RAM_en<=1'b1;
				M_Write<=M_Write_ALU;
				tx_start<=1'b0;
				tx_in<=8'b0;
				clk_insert_active<=1'b1;
			end
			
			
			ram_to_pc:
			begin
				RAM_ADDRESS<=address_temp2;
				tx_in<=RAM_DATA_out;
				RAM_en<=1'b1;
				M_Write<=1'b0;
				tx_start<=1'b1;
				clk_insert_active<=1'b0;
				
			end
			
		endcase
	 end
	 
	 
	 UART UART_Mod(.clk(clk),
						.reset(reset),
				
						.rx(rx),
						.rx_done_tick(rx_done_tick),
						.rx_out(rx_out),
				
						.tx_start(tx_start),
						.tx_in(tx_in),
						.tx_done_tick(tx_done_tick),
						.tx(tx)
	);
	 
	DeBouncers DeBounce_Mod(.clk(clk),
	
									.PC_RAM_ACT(PC_RAM_ACT),
									.RAM_PC_ACT(RAM_PC_ACT),
									.PROCESS_ACT(PROCESS_ACT),		
									.IDLE_ACT(IDLE_ACT),
									
									.DB_Out_PC_RAM(DB_Out_PC_RAM),
									.DB_Out_RAM_PC(DB_Out_RAM_PC),
									.DB_Out_PROCESS(DB_Out_PROCESS),
									.DB_Out_IDLE(DB_Out_IDLE)
	);
	wire clk_insert;
	clkReal clkReal(
    .clk(clk),
    .active(clk_insert_active),
    .system_clk(clk_insert)
    );
	
reg RAM_en;
reg M_Write;
wire [1:0] control_signal;
	
assign control_signal[0]=M_Write;
assign control_signal[1]=RAM_en;

reg [15:0] RAM_ADDRESS;
reg [15:0] RAM_DATA_in,DATA_BUS_out;
wire [15:0] RAM_DATA_out;
reg pro_select;

wire End_of_process;
wire [7:0] INS_ADDRESS;
wire [15:0] RAM_ADDRESS_ALU;
RAM DATA_MEMORY(clk,RAM_ADDRESS,RAM_DATA_in,RAM_DATA_out,control_signal);
P2Processor Processor(clk_insert,RAM_ADDRESS_ALU,DATA_BUS_out,DATA_BUS_in,M_Write_ALU,RAM_en_ALU,End_of_process,INS_ADDRESS);
endmodule
