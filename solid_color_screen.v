`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2017 01:19:22 PM
// Design Name: 
// Module Name: solid_color_screen
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


module solid_color_screen(state, hcnt, vcnt, color, color_out);

    input state, hcnt, vcnt, color;
    output color_out;
    
    wire [1:0] state;
    wire [9:0] hcnt, vcnt;
    wire [2:0] color;
    reg [2:0] color_out;
    
    always @ (*) begin
        
        if (state == 2'b00) 
            color_out <= color;
        else color_out <= 3'bzzz;  
    end
    
endmodule
