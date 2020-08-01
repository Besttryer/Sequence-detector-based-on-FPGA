`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/31 15:10:42
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk=0;
    reg rst_n=1;
    reg key1=0;
    reg key2=0;
    wire rgb;
    
    top test(
    .clk(clk),
    .key_1(key1),
    .key_2(key2),
    .rst_n(rst_n),
    .o_rgb_led(rgb)
    );    
    
    //Given button stimulus
 initial 
 begin 
 clk = 0;
 #100;
 rst_n=1;
 key1=1;
 key2=1;
 #100;
 key1=0;
 #20;
 key1=1;
 #100;
 key2=0;
 #20;
 key2=1;
 #100;
 key1=0;
 #20;
 key1=1;
 #100;
 key2=0;
 #20;
 key2=1;
 #100;
 key1=0;
 #20;
 key1=1;
 #100;
 key2=0;
 #20;
 key2=1;
 #100
 key2=0;
 #20
 key2=1;
 #1000 $stop; 
 end
 //Generate clock excitation, 100MHz
 always 
 begin 
 #10 clk = ~clk; 
 end
endmodule
