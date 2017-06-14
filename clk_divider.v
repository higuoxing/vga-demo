`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/28/2017 10:10:38 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(clk, divided_clk);

    integer clk_cnt = 1;

    input clk;
    output divided_clk;
    
    reg divided_clk;
    reg cnt;
    
    always @ (posedge(clk)) begin
        if (cnt == clk_cnt) begin
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1;
            divided_clk <= ~ divided_clk;
        end
    end
    
endmodule
