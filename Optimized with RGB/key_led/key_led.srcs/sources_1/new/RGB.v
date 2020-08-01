`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 16:03:04
// Design Name: 
// Module Name: RGB
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


module RGB(
    input clk_100MHz,
    input i_rst,
    input i_en,  //调节亮度的
    input i_key,  //换颜色的
    output o_rgb_led
    );
    

    
    //数据
    wire [5:0]period_100ms;
    wire [23:0]rgb_data_0;
    wire [23:0]rgb_data_1;
    

    
    //按键测试颜色和周期
    Key_Test_Color Key_Test_Color_0(
        .i_clk(clk_100MHz),
        .i_rst(i_rst),
        .i_key(i_key),
        .o_period_100ms(period_100ms),
        .o_rgb_data_0(rgb_data_0),
        .o_rgb_data_1(rgb_data_1)
        );
    
    //RGB LED的驱动
    Driver_RGB_LED RGB_LED_0(
        .i_clk(clk_100MHz),
        .i_rst(i_rst),
        .i_en(i_en),
        .i_rgb_data0(rgb_data_0),
        .i_rgb_data1(rgb_data_1),
        .i_period_100ms(period_100ms),
        .o_rgb_bus(o_rgb_led)
    );
endmodule
