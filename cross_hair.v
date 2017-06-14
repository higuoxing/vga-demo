`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/30/2017 12:43:42 PM
// Design Name: 
// Module Name: cross_hair
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


module cross_hair(state, hcnt, vcnt, color, color_out);

    input state;
    input hcnt, vcnt, color;
    output color_out;
    
    wire [1:0] state;
    wire [9:0] hcnt, vcnt;
    wire [2:0] color;
    reg [2:0] color_out;
    
    always @ (*) begin
        if (state == 1) begin    //
            color_out <= ((vcnt >= 240 && vcnt <= 241) || (hcnt >= 320 && hcnt <= 321)) ? color: ~ color;
        end
        else color_out <= 3'bzzz;
    end
    
    
    
endmodule

//    always @ (*) begin
//        if (state == 0) begin    //color block
//            color_out <= color;
//        end
//        else if (state == 1) begin       //cross hair pattern
//            color_out <= ((vcnt_out >= 239 && vcnt_out <= 241) || (hcnt_out >= 319 && hcnt_out <= 321)) ? color: ~ color;
//        end
//        else if (state == 2) begin    //
//            color_out <= ((vcnt_out >= 230 && vcnt_out <= 250) && (hcnt_out >= 310 && hcnt_out <= 330)) ? color: ~ color;
//        end
//        else if (state == 3) begin
//            color_out <= 3'b101;
//        end
//    end
    