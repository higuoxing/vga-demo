//Created by Higuoxing
//Have fun :)

`timescale 1ns / 1ps

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
