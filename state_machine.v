`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2017 11:13:31 AM
// Design Name: 
// Module Name: state_machine
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

`define color_block 0
`define cross_hair_pattern 1
`define pixels_pattern 2
`define something 3

module state_machine(clk, sw, state);

    input clk, sw;
    output state;
    
    wire [1:0] sw;
    reg [1:0] state;
    
    always @ (*) begin
        case (sw)
            2'b00: state <= `color_block;
            2'b01: state <= `cross_hair_pattern;
            2'b10: state <= `pixels_pattern;
            2'b11: state <= `something;
            default: state <= `color_block;
        endcase
    end
    
endmodule
