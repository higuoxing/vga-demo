`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 03:22:56 AM
// Design Name: 
// Module Name: test_file
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


module test_file(clk, hsync, vsync, rotozoom_pix);
    
    input clk, hsync, vsync;
    output rotozoom_pix;
    reg [15:0] X0, Y0, X1, Y1;
    
    always @(posedge clk)
    if(vsync) 
    begin
        X0 <= 0;
        Y0 <= 0;
        X1 <= 0;
        Y1 <= 0;
    end
    else
    if(hsync) 
    begin
        X0 <= X1 - 100;
        Y0 <= Y1 + 400;
        X1 <= X1 - 100;
        Y1 <= Y1 + 400;
    end
    else
    begin
        X0 <= X0 + 400;
        Y0 <= Y0 + 100;
    end
    
    // Display a chessboard pattern by XOR'ing the MSB of X and Y counters
    // You could also display a rotozoomed bitmap by feeding X and Y to a bitmap in a RAM
    
    wire [2:0] color;
    assign color = (X0[15] ^ Y0[15]) ? 3'b000: 3'b111;
endmodule
