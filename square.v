`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2017 12:42:29 PM
// Design Name: 
// Module Name: square
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


module square(state, hcnt, vcnt, color, color_out);
    
    input state, hcnt, vcnt, color;
    output color_out;
    
    wire [1:0] state;
    wire [9:0] hcnt, vcnt;
    wire [2:0] color;
    reg [2:0] color_out;
    
    always @ (*) begin
        if (state == 2) begin    //
            color_out <= ((vcnt >= 240 && vcnt <= 244) && (hcnt >= 320 && hcnt <= 324)) ? color: ~ color;
        end
        else color_out <= 3'bzzz;
    end
    
endmodule
