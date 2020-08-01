`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 21:26:50
// Design Name: 
// Module Name: XLJC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module XLJC(clk,rst_n,key1,key2,led);

	input clk;		//系统时钟
	input rst_n;
	input key1;
	input key2;
	output led;		//检测到1010输出高电平，未检测到低电平
	
	reg [4:0] state;
	reg  led;
	reg [4:0] state_n;
	
	reg key_tmpa1,key_tmpa2;
	reg key_tmpb1,key_tmpb2;
	wire nedge1,nedge2;
	
	parameter S0 = 5'b00001;		//检测1
	parameter S1 = 5'b00010;		//检测0
	parameter S2 = 5'b00100;		//检测1
	parameter S3 = 5'b01000;		//检测0
	parameter S4 = 5'b10000;
	//1010序列检测状态机
	always@(posedge clk , negedge rst_n)
	if(!rst_n)
	    state <= S0;	//复位情况下状态跳转到检测第一位数字的状态
	else 
		state <= state_n;
			
		
	always@(*)begin
		case(state)
			//第一个数字检测状态  1  key1
			S0:begin
				if(nedge1)	
					state_n <= S1;
				else if(nedge2)
					state_n <= S0;
				else 
					state_n <= S0;
			end
			
			//第二个数字检测状态   0  key2
			S1:begin
				if(nedge2)
					state_n <= S2;
				else if(nedge1)
					state_n <= S1;
				else 
					state_n <= S1;
			end
			//第三个数字检测状态  1  key1
			S2:begin
				if(nedge1)
					state_n <= S3;
				else if(nedge2)
					state_n <= S0;
				else 
					state_n <= S2;
			end
			//第四个数字检测状态  0  key2
			S3:begin
				if(nedge2)
					state_n <= S4;
				else if(nedge1)
					state_n <= S1;
				else 
					state_n <= S3;
			end
			S4:begin
				if(nedge2)
					state_n <= S0;
				else if(nedge1)
					state_n <= S3;
				else
					state_n <= S4;
			end
			//其他情况下，使状态停留在S0状态
			default:state_n <= state_n;
		endcase
	end
	
	//使用D触发器存储两个相邻时钟上升沿时外部输入信号（已经同步到系统时钟域中）的电平状态
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		key_tmpa1 <= 1'b0;
		key_tmpb1 <= 1'b0;
	end
	else begin
		key_tmpa1 <= key1;
		key_tmpb1 <= key_tmpa1;	
	end

//产生跳变沿信号	
	assign nedge1 = !key_tmpa1 & key_tmpb1;

	
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		key_tmpa2 <= 1'b0;
		key_tmpb2 <= 1'b0;
	end
	else begin
		key_tmpa2 <= key2;
		key_tmpb2 <= key_tmpa2;	
	end

//产生跳变沿信号	
	assign nedge2 = !key_tmpa2 & key_tmpb2;
	
	
	
	//输出数据定义
	always@(*) begin
		case(state) 
			S0 : led = 1; 
			S1 : led = 1; 
			S2 : led = 1; 
			S3 : led = 1;
			S4 : led = 0;
		default :led = 1;
		endcase
	end
	
endmodule