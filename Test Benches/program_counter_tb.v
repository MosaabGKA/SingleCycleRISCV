module program_counter_tb;
    reg clk;
    reg rst;
    reg [63:0] pc;
    wire [63:0] next_pc;
    
    program_counter program_counter_tb (
        .clk(clk),
        .rst(rst),
        .pc(pc),
        .next_pc(next_pc)
    );

    pc_plus_4 pc_plus_4_tb (
        .pc(pc),
        .next_pc(next_pc)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 0;
        pc = 64'h0;
        
        $display("Testing Program Counter:");
        
        rst = 1;
        #10; $display("After reset: next_pc=%h", next_pc);
        
        rst = 0;
        pc = 64'h100;
        #10; $display("Clock 1: pc=%h, next_pc=%h", pc, next_pc);
        
        pc = 64'h104;
        #10; $display("Clock 2: pc=%h, next_pc=%h", pc, next_pc);
        
        pc = 64'h108;
        #10; $display("Clock 3: pc=%h, next_pc=%h", pc, next_pc);
        
        pc = 64'h10C;
        rst = 1;
        #10; $display("Reset during operation: next_pc=%h", next_pc);

        
        $display("Testing PC Plus 4:");
        
        pc = 64'h100;
        #10; $display("Test 1: pc=%h, next_pc=%h", pc, next_pc);
        
        pc = 64'h0;
        #10; $display("Test 2: pc=%h, next_pc=%h", pc, next_pc);
        
        pc = 64'hFFFFFFFFFFFFFFFC;
        #10; $display("Test 3: pc=%h, next_pc=%h", pc, next_pc);
        
        pc = 64'h12345678;
        #10; $display("Test 4: pc=%h, next_pc=%h", pc, next_pc);
        
        $finish;
    end
endmodule
