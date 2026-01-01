module immediate_generator_tb;
    reg [31:0] instruction;
    wire [63:0] immediate;
    
    immediate_generator immediate_generator (
        .instruction(instruction),
        .immediate(immediate)
    );
    
    initial begin
        $display("Testing Immediate Generator:");
        
        // Test 1: I-type immediate (addi)
        instruction = 32'h00700013;  // addi x0, x0, 7
        #10;
        $display("Test 1: I-type instr=%h, immediate=%h", 
                 instruction, immediate);
        
        // Test 2: Load-type immediate
        instruction = 32'h00003C03;  // ld x24, 0(x0)
        #10;
        $display("Test 2: Load-type instr=%h, immediate=%h", 
                 instruction, immediate);
        
        // Test 3: Store-type immediate
        instruction = 32'h00A02023;  // sd x10, 0(x0)
        #10;
        $display("Test 3: Store-type instr=%h, immediate=%h", 
                 instruction, immediate);
        
        // Test 4: B-type immediate (positive offset)
        instruction = 32'h015C0463;  // beq x24, x21, L1
        #10;
        $display("Test 4: B-type instr=%h, immediate=%h", 
                 instruction, immediate);
        
        // Test 5: B-type immediate (negative offset)
        instruction = 32'hFE020EE3;  // Example with negative offset: jalr ra, -32(t0)
        #10;
        $display("Test 5: B-type negative instr=%h, immediate=%h", 
                 instruction, immediate);
        
        // Test 6: J-type immediate
        instruction = 32'h0000006F;  // jal x0, 0
        #10;
        $display("Test 6: J-type instr=%h, immediate=%h", 
                 instruction, immediate);
        
        // Test 7: Unknown opcode
        instruction = 32'hFFFFFFFF;
        #10;
        $display("Test 7: Unknown instr=%h, immediate=%h (should be 0)", 
                 instruction, immediate);
        
        $finish;
    end
endmodule