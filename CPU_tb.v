`timescale 1ns / 1ps

module RISCV_Tb;

    reg clk, rst;
    
    RISCV CPU (
        .clk(clk), 
        .rst(rst)
    );

    initial begin
        clk = 0;
    end

    always #50 clk = ~clk; 

    initial begin
        rst = 1'b1;
        #50;
        rst = 1'b0; 
        #10000; 
        $finish; 
    end

endmodule