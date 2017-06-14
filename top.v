`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2017 10:09:10 PM
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


module top(clk, color, sw, up, down, left, right, hsync, vsync, vga_r, vga_g, vga_b);

    input clk;
    input sw;
    input color;
    input up, down, left, right;
    output hsync, vsync, vga_r, vga_g, vga_b;
    
    wire up, down, left, right;
    wire [1:0] sw;
    wire clk, clk_1_4;
    wire clk_25M;
    wire hsync, vsync, vga_r, vga_g, vga_b;
    wire [2:0] color;
    wire [9:0] hcnt, vcnt;
    wire [9:0] hcnt_out, vcnt_out;
    wire [1:0] state;
//  reg [2:0] cross_hair_color;
    wire [2:0] color_out;
    
    //clock divider
    clk_divider divide_clk(clk, clk_25M);
    clk_divider_1_4Hz divide_clk_1_4Hz(clk, clk_1_4);
    
    //state_machine
    state_machine sm(clk, sw, state); 
    
    //solid color screen
    solid_color_screen scs(state, hcnt, vcnt, color, color_out);
    
    //square & square handler
    square_handler s_h(clk_1_4, up, down, left, right, hcnt, vcnt, hcnt_out, vcnt_out);
    square sq(state, hcnt_out, vcnt_out, color, color_out);
   
    //crosshair & crosshair_handler
    cross_hair c_h(state, hcnt, vcnt, color, color_out);
    
    vga vga_test(clk_25M, color_out, hsync, vsync, hcnt, vcnt, vga_r, vga_g, vga_b);
    
endmodule
