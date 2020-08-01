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

	input clk;		//ϵͳʱ��
	input rst_n;
	input key1;
	input key2;
	output led;		//��⵽1010����ߵ�ƽ��δ��⵽�͵�ƽ
	
	reg [4:0] state;
	reg  led;
	reg [4:0] state_n;
	
	reg key_tmpa1,key_tmpa2;
	reg key_tmpb1,key_tmpb2;
	wire nedge1,nedge2;
	
	parameter S0 = 5'b00001;		//���1
	parameter S1 = 5'b00010;		//���0
	parameter S2 = 5'b00100;		//���1
	parameter S3 = 5'b01000;		//���0
	parameter S4 = 5'b10000;
	//1010���м��״̬��
	always@(posedge clk , negedge rst_n)
	if(!rst_n)
	    state <= S0;	//��λ�����״̬��ת������һλ���ֵ�״̬
	else 
		state <= state_n;
			
		
	always@(*)begin
		case(state)
			//��һ�����ּ��״̬  1  key1
			S0:begin
				if(nedge1)	
					state_n <= S1;
				else if(nedge2)
					state_n <= S0;
				else 
					state_n <= S0;
			end
			
			//�ڶ������ּ��״̬   0  key2
			S1:begin
				if(nedge2)
					state_n <= S2;
				else if(nedge1)
					state_n <= S1;
				else 
					state_n <= S1;
			end
			//���������ּ��״̬  1  key1
			S2:begin
				if(nedge1)
					state_n <= S3;
				else if(nedge2)
					state_n <= S0;
				else 
					state_n <= S2;
			end
			//���ĸ����ּ��״̬  0  key2
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
			//��������£�ʹ״̬ͣ����S0״̬
			default:state_n <= state_n;
		endcase
	end
	
	//ʹ��D�������洢��������ʱ��������ʱ�ⲿ�����źţ��Ѿ�ͬ����ϵͳʱ�����У��ĵ�ƽ״̬
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		key_tmpa1 <= 1'b0;
		key_tmpb1 <= 1'b0;
	end
	else begin
		key_tmpa1 <= key1;
		key_tmpb1 <= key_tmpa1;	
	end

//�����������ź�	
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

//�����������ź�	
	assign nedge2 = !key_tmpa2 & key_tmpb2;
	
	
	
	//������ݶ���
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