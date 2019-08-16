`timescale 1ns / 1ps
module CU(
		clk,
		IR_Input,
		Main_Control_Signal		
    );

//-------Input Output Ports

input clk;
input [7:0] IR_Input;
output  reg [20:0] Main_Control_Signal;

parameter SIZE = 3;
parameter IDLE = 3'b001;
parameter GOTOZ = 3'b010;
parameter LOADAC = 3'b100;

parameter IDLE_STATE = 1'b0;
parameter LOADIR = 1'b1;

reg [SIZE-1:0] state;
reg [SIZE-1:0] next_state;

reg IR_state;
reg next_IR_state;
reg IR_Signal;
reg [7:0] IR_Input_Act;
initial next_IR_state = 1'b0;
initial IR_Input_Act<=IR_Input;



always @(*)
	//next_IR_state = 1'b0;
	begin:IR_State_Detect
		case(IR_state)
			IDLE_STATE:
				if(IR_Signal==1'b1)
					begin
						next_IR_state=LOADIR;
					end
				else
					begin
						next_IR_state=IDLE_STATE;
					end
			LOADIR:
				if(IR_Signal==1'b0)
					begin
						next_IR_state=IDLE_STATE;
					end
				else
					begin
						next_IR_state=LOADIR;
					end
			default:next_IR_state=IDLE_STATE;
		endcase
	end
	
always @ (*)
		begin
			IR_state<= next_IR_state;
		end

always @ (*)
		begin
			case(IR_state)
				IDLE_STATE:
					begin
						IR_Input_Act<=IR_Input;
					end
				LOADIR:
					begin
						IR_Input_Act<=IR_Input_Act;
					end
				endcase
		end

always @(state or IR_Input_Act)
begin:State_Detect
	next_state = 3'b000;
	case(state)
		IDLE:if(IR_Input_Act==8'b00000001)
					begin
						next_state=LOADAC;
					end
				else if(IR_Input_Act==8'b00000010)
					begin
						next_state=GOTOZ;
					end
				else
					begin
						next_state=IDLE;
					end
		GOTOZ:if(IR_Input_Act==8'b00000010)
					begin
						next_state=GOTOZ;
					end
				else
					begin
						next_state=IDLE;
					end
		LOADAC:if(IR_Input_Act==8'b00000001)
					begin
						next_state=LOADAC;
					end
				else
					begin
						next_state=IDLE;
					end
		default: next_state = IDLE;
	endcase
end	

always @ (posedge clk)
		begin
			state<= next_state;
		end
	
always @ (negedge clk)
		begin
			case(state)
				IDLE:
					begin
						Main_Control_Signal<= #10 20'b00000000000000000001;
					end
				GOTOZ:
					begin
						#10 Main_Control_Signal<= 20'b00000000000000000001;
						#10 Main_Control_Signal<= 20'b00000000000000100001;
						#10 Main_Control_Signal<= 20'b00000000000000010001;
						#10 Main_Control_Signal<= 20'b00000000000010000001;	
					end
				LOADAC:
					begin
						#10 Main_Control_Signal<= 20'b000000000000000000000;
						IR_Signal<=1;
						#10 Main_Control_Signal<= 20'b000000010000000000000;
						
						#10 Main_Control_Signal<= 20'b000000000000000000001;
						#10 Main_Control_Signal<= 20'b100000001000000110000;
						IR_Signal<=0;
						#10 Main_Control_Signal<= 20'b000000000000000001010;
						#10 Main_Control_Signal<= 20'b000010000010000110000;
					
					end
				endcase
		end
	
endmodule
