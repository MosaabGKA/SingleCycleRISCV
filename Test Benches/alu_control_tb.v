module alu_control_tb;
    reg [2:0] funct3;
    reg [6:0] funct7;
    reg [1:0] alu_op;
    wire [3:0] alu_ctrl;
    
    alu_control alu_control (
        .funct3(funct3),
        .funct7(funct7),
        .alu_op(alu_op),
        .alu_ctrl(alu_ctrl)
    );
    
    initial begin
        $display("Testing ALU Control:");
        
        // Test 1: ALU_OP = 00 (Load/Store)
        alu_op = 2'b00;
        #10;
        $display("Test 1: alu_op=00, alu_ctrl=%b", alu_ctrl);
        
        // Test 2: ALU_OP = 01 (Branch)
        alu_op = 2'b01;
        #10;
        $display("Test 2: alu_op=01, alu_ctrl=%b", alu_ctrl);
        
        // Test 3: ALU_OP = 10 (R-type/I-type)
        alu_op = 2'b10;
        
        // Test ADD
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #10;
        $display("Test 3: ADD: funct3=000, funct7=0000000, alu_ctrl=%b", alu_ctrl);
        
        // Test SUB
        funct3 = 3'b000;
        funct7 = 7'b0100000;
        #10;
        $display("Test 4: SUB: funct3=000, funct7=0100000, alu_ctrl=%b", alu_ctrl);
        
        // Test SLL
        funct3 = 3'b001;
        funct7 = 7'b0000000;
        #10;
        $display("Test 5: SLL: funct3=001, alu_ctrl=%b", alu_ctrl);
        
        // Test XOR
        funct3 = 3'b100;
        funct7 = 7'b0000000;
        #10;
        $display("Test 6: XOR: funct3=100, alu_ctrl=%b", alu_ctrl);
        
        // Test SRL
        funct3 = 3'b101;
        funct7 = 7'b0000000;
        #10;
        $display("Test 7: SRL: funct3=101, funct7=0, alu_ctrl=%b", alu_ctrl);
        
        // Test SRA
        funct3 = 3'b101;
        funct7 = 7'b0100000;
        #10;
        $display("Test 8: SRA: funct3=101, funct7=0100000, alu_ctrl=%b", alu_ctrl);
        
        // Test OR
        funct3 = 3'b110;
        funct7 = 7'b0000000;
        #10;
        $display("Test 9: OR: funct3=110, alu_ctrl=%b", alu_ctrl);
        
        // Test AND
        funct3 = 3'b111;
        funct7 = 7'b0000000;
        #10;
        $display("Test 10: AND: funct3=111, alu_ctrl=%b", alu_ctrl);
        
        $finish;
    end
endmodule
