module alu_tb;
    reg [63:0] a;
    reg [63:0] b;
    reg [3:0] alu_control;
    wire [63:0] result;
    wire zero;
    
    alu alu (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );
    
    initial begin
        $display("Testing ALU:");
        
        // ADD
        a = 64'h5;
        b = 64'h3;
        alu_control = 4'b0000;
        #10;
        $display("Test 1: ADD: %h + %h = %h, zero=%b", a, b, result, zero);
        
        // SUB
        a = 64'hA;
        b = 64'h3;
        alu_control = 4'b0001;
        #10;
        $display("Test 2: SUB: %h - %h = %h, zero=%b", a, b, result, zero);
        
        // SLL (shift left logical)
        a = 64'h1;
        b = 64'h3;  
        alu_control = 4'b0010;
        #10;
        $display("Test 3: SLL: %h << %h = %h", a, b, result);
        
        // AND
        a = 64'hF0F0F0F0;
        b = 64'h0F0F0F0F;
        alu_control = 4'b0101;
        #10;
        $display("Test 4: AND: %h & %h = %h", a, b, result);
        
        // OR
        a = 64'hF0F0F0F0;
        b = 64'h0F0F0F0F;
        alu_control = 4'b0110;
        #10;
        $display("Test 5: OR: %h | %h = %h", a, b, result);
        
        // XOR
        a = 64'hF0F0F0F0;
        b = 64'h0F0F0F0F;
        alu_control = 4'b0111;
        #10;
        $display("Test 6: XOR: %h ^ %h = %h", a, b, result);
        
        // Zero flag test
        a = 64'h5;
        b = 64'hFFFFFFFFFFFFFFFB; // -5
        alu_control = 4'b0000;
        #10;
        $display("Test 7: Zero flag: %h + %h = %h, zero=%b", a, b, result, zero);

        // SRR (shift right logical)
        a = 64'h1f;
        b = 64'h3;  
        alu_control = 4'b0011;
        #10;
        $display("Test 8: SRR: %h >> %h = %h", a, b, result);

        
        $finish;
    end
endmodule
