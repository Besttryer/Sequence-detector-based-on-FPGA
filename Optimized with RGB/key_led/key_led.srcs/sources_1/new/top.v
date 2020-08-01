`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 08:58:52
// Design Name: 
// Module Name: top
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


module top(
    clk,
    key_1,
    key_2,
    rst_n,
    o_rgb_led
    );    
    input clk;
    input key_1;
    input key_2;
    input rst_n;
    
    output o_rgb_led;
    
    wire key_flag1,key_state1;
    wire key_flag2,key_state2;
    wire led;
    wire key1,key2;
    wire en;
    //时钟
    wire clk_100MHz;
    
    assign key1 = key_flag1 && !key_state1;
    assign key2 = key_flag2 && !key_state2;
    
    //时钟生成
    clk_wiz_0 system_clock(.clk_out1(clk_100MHz),.clk_in1(clk));
    
    key_filter key_one(
        .Clk(clk_100MHz),
        .Rst_n(rst_n),
        .key_in(key_1),
        .key_flag(key_flag1),
        .key_state(key_state1)
        );
    
    key_filter key_two(
        .Clk(clk_100MHz),
        .Rst_n(rst_n),
        .key_in(key_2),
        .key_flag(key_flag2),
        .key_state(key_state2)
        );
        
    XLJC XLJC(
        .clk(clk_100MHz),
        .rst_n(rst_n),
        .key1(key1),
        .key2(key2),
        .led(led)
        );
    en_out emt(
       .clk(clk_100MHz),
       .rst_n(rst_n),
       .led(led),
       .en(en)
       );
     RGB rgb(
      .clk_100MHz(clk_100MHz),
      .i_rst(rst_n),
      .i_en(1),  
      .i_key(en),  //换颜色的
      .o_rgb_led(o_rgb_led)
    );
    
endmodule
