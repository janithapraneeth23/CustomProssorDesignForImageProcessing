`timescale 1ns / 1ps

module DeBouncers
	(clk,
	
	PC_RAM_ACT,
	RAM_PC_ACT,
	PROCESS_ACT,		
	IDLE_ACT,
	
	DB_Out_PC_RAM,
	DB_Out_RAM_PC,
	DB_Out_PROCESS,
	DB_Out_IDLE
    );
	input clk;
	 
	input PC_RAM_ACT;
	input RAM_PC_ACT;
	input PROCESS_ACT;		
	input IDLE_ACT;
	
	output DB_Out_PC_RAM;
	output DB_Out_RAM_PC;
	output DB_Out_PROCESS;
	output DB_Out_IDLE;
	
	wire [7:0] temp;

 Debouncer DB_PC_TO_RAM(
    .clk(clk),
    .PB(PC_RAM_ACT),
    .PB_state(temp[0]),
    .PB_down(temp[1]),
    .PB_up(DB_Out_PC_RAM)
    );
	 
	 Debouncer DB_RAM_TO_PC(
    .clk(clk),
    .PB(RAM_PC_ACT),
    .PB_state(temp[2]),
    .PB_down(temp[3]),
    .PB_up(DB_Out_RAM_PC)
    );
	 
	 Debouncer DB_PROCESS(
    .clk(clk),
    .PB(PROCESS_ACT),
    .PB_state(temp[4]),
    .PB_down(temp[5]),
    .PB_up(DB_Out_PROCESS)
    );
	 
	 Debouncer DB_IDLE(
    .clk(clk),
    .PB(IDLE_ACT),
    .PB_state(temp[6]),
    .PB_down(temp[7]),
    .PB_up(DB_Out_IDLE)
    );
	 
endmodule
