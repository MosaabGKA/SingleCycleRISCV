module instruction_memory_tb;
    reg rst;
    reg clk;
    reg [63:0] instr_address;
    wire [63:0] instruction;
    
    instruction_memory instruction_memory (
        .rst(rst),
        .clk(clk),
        .instr_address(instr_address),
        .instruction(instruction)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        instr_address = 64'h0;
        
        #10 rst = 0;
        
        // Test reading each instruction
        $display("Testing Instruction Memory:");
        instr_address = 0;
        #10 $display("Address 0: Instruction = %h", instruction);
        
        instr_address = 4;
        #10 $display("Address 4: Instruction = %h", instruction);
        
        instr_address = 8;
        #10 $display("Address 8: Instruction = %h", instruction);
        
        instr_address = 12;
        #10 $display("Address 12: Instruction = %h", instruction);
        
        // Test reset functionality
        rst = 1;
        #10 $display("After reset - Address 0: Instruction = %h", instruction);
        
        $display("Test completed");
        $finish;
    end
endmodule