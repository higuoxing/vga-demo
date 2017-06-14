`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2017 01:22:47 PM
// Design Name: 
// Module Name: clk_divider_1_4Hz
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



module clk_divider_1_4Hz (clk, divided_clk);

    integer clk_cnt = 250000;

    input clk;
    output divided_clk;
    
    reg divided_clk;
    reg [32:0] cnt;
    
    initial begin
        cnt <= 0;
    end
    
    always @ (posedge(clk)) begin
        if (cnt == clk_cnt) begin
            cnt <= 0;
            divided_clk <= ~ divided_clk;
        end
        else begin
            cnt <= cnt + 1;
        end
    end
    
endmodule