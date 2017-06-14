//Created by Higuoxing@outlook.com
//Have fun :)

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//VS:￣￣￣￣￣￣|_____|￣￣￣￣￣￣￣￣￣￣￣￣|____|￣￣￣￣￣￣￣￣￣￣￣￣|_______
//
//HS:￣￣￣￣￣￣|_____|￣|_|￣|...|_|￣|_|￣|____|￣|_|￣|...|_|￣|_|￣|_____
//
//VS:￣￣￣￣￣￣|_____|￣￣￣￣￣￣￣￣￣￣￣￣|____|￣￣￣￣￣￣￣￣￣￣￣￣|_______
//        ^   ^     ^   ^          ^    ^    ^ 
//T:      d (e)a    b   c          d    e
//        front sync back           front 
//////////////////////////////////////////////////////////////////////////////////


module vga(clk_25M, color, hsync, vsync, hcnt_out, vcnt_out, vga_r, vga_g, vga_b);
    
    input clk_25M, color;
    output hsync, vsync, hcnt_out, vcnt_out, vga_r, vga_g, vga_b;
    
    
    wire clk_25M;
    wire [2:0] color;
    reg hsync, vsync;
    wire [9:0] hcnt_out;
    wire [9:0] vcnt_out;
    reg vga_r, vga_g, vga_b;
    
    integer h = 640;    //herizontal pixels
    integer h_front = 16;
    integer h_back = 48;
    integer h_sync = 96;
    integer h_period = 800;  //herizontal period
    
    integer v = 480;    //veritical pixels
    integer v_front = 10;
    integer v_back = 33;
    integer v_sync = 2;
    integer v_period = 525;  //vertical period
    
    reg h_enable, v_enable;
    reg [9:0] hcnt;
    reg [9:0] vcnt;
    
    
    always @ (posedge(clk_25M)) begin    //herizontal period
    
        if (hcnt < h_period) begin
            hcnt <= hcnt + 1;
        end
        else begin
            hcnt <= 0;
        end
        
    end
    
    
    always @ (posedge(clk_25M)) begin    //herizontal synchronous period
        
        if ((hcnt >= (h + h_front)) && (hcnt < (h + h_sync + h_front))) begin
            hsync <= 0;
        end
        else begin
            hsync <= 1;
        end
    
    end
    
    
    always @ (posedge(clk_25M)) begin    //vertical scanning
        
        if (hcnt == (h + h_sync + h_front)) begin
            if (vcnt < v_period) begin
                vcnt <= vcnt + 1;
            end
            else begin
                vcnt <= 0;
            end
        end
    
    end
    
    
    always @ (posedge(clk_25M)) begin     //vertical synchronous period
        
        if ((vcnt >= (v + v_front)) && (vcnt < (v + v_sync + v_front))) begin
            vsync <= 0;
        end
        else begin
            vsync <= 1;
        end
    
    end    
    
    
    always @ (posedge(clk_25M)) begin    //vertical & herizontal enable
        
        if (hcnt < h) begin
            h_enable <= 1;
        end
        else begin
            h_enable <= 0;
        end
    
    end
    
    
    always @ (posedge(clk_25M)) begin    
        
        if (vcnt < v) begin
            v_enable <= 1;
        end
        else begin
            v_enable <= 0;
        end
    
    end
    
    
    always @ (posedge(clk_25M)) begin    //fill colors
    
        if ((v_enable == 1) && (h_enable == 1)) begin
            if ((vcnt < 480) && (hcnt < 640)) begin
            
                vga_r <= color[2];
                vga_g <= color[1];
                vga_b <= color[0];
                
            end
            
            else begin
                vga_r <= 1'b0;
                vga_g <= 1'b0;
                vga_b <= 1'b0;                
            end
        end
    
    end
    
    assign hcnt_out = hcnt;    //output coordinates
    assign vcnt_out = vcnt;

endmodule
