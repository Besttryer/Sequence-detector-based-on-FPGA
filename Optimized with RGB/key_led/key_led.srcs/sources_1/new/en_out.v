`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 16:33:16
// Design Name: 
// Module Name: en_out
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


module en_out(
    clk    ,
    rst_n  ,
    led    ,
    en
    );

    
    
    //输入信号定义
    input               clk    ;
    input               rst_n  ;
    input               led    ;

    //输出信号定义
    output  en   ;

    //输出信号reg定义
    reg     en   ;

    //中间信号定义
    reg                 cnt;
    reg   led_tmpa,led_tmpb;
    wire              nedge;
    wire     add_cnt,end_cnt;

  //使用D触发器存储两个相邻时钟上升沿时外部输入信号（已经同步到系统时钟域中）的电平状态
	always@(posedge clk or negedge rst_n)
	if(!rst_n)begin
		led_tmpa <= 1'b0;
		led_tmpb <= 1'b0;
	end
	else begin
		led_tmpa <= led;
		led_tmpb <= led_tmpa;	
	end

//产生跳变沿信号	
	assign nedge = !led_tmpa & led_tmpb;
    

    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            cnt <= 0;
        end
        else if(add_cnt)begin
            if(end_cnt)
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    end
    assign add_cnt = en ==0;       
    assign end_cnt = add_cnt && cnt== 3_000_000-1;   

    always  @(posedge clk or negedge rst_n)begin
        if(rst_n==1'b0)begin
            en <=1;
        end
        else if(nedge)begin
            en <=0;
        end
        else if(end_cnt)begin
            en <=1;
        end
    end


    endmodule

