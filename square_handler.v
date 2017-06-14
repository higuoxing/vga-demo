`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2017 12:56:19 PM
// Design Name: 
// Module Name: square_handler
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


module square_handler(clk_1Hz, up, down, left, right, hcnt, vcnt, hcnt_out, vcnt_out);

    input clk_1Hz, up, down, left, right, hcnt, vcnt;
    output hcnt_out, vcnt_out;
    
    wire clk_1Hz;
    wire up, down, left, right;
    wire [9:0] hcnt, vcnt;
    reg [9:0] hcnt_out, vcnt_out;
    
    reg [9:0] up_count;
    reg [9:0] down_count;
    reg [9:0] left_count;
    reg [9:0] right_count;
    
    initial begin
        up_count <= 0;
        down_count <= 0;
        left_count <= 0;
        right_count <= 0;
    end
    
    always @ (*) begin
        hcnt_out <= hcnt + right_count - left_count;
        vcnt_out <= vcnt + down_count - up_count;
    end
    
    always @ (posedge(clk_1Hz)) begin
        
        if (up) begin
            up_count <= up_count + 1;
        end
        else if (down) begin
            down_count <= down_count + 1;
        end
        else if (right) begin
            right_count <= right_count + 1;
        end
        else if (left) begin
            left_count <= left_count + 1;
        end
        else begin
            up_count <= up_count;
            down_count <= down_count;
            left_count <= left_count;
            right_count <= right_count;
        end
        
    end
    
endmodule
