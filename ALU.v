module alu(
    input [63:0] a,             
    input [63:0] b,            
    input [3:0] alu_control,          
    output reg [63:0] result,   
    output reg zero
);

    always @(a or b or alu_control) begin
        case (alu_control)
            4'b0000: result = a + b;                // ADD, ADDI, SD/LD address calculation
            4'b0001: result = a - b;                // SUB
            4'b0010: result = a << b[5:0];          // SLL, SLLI (logical left shift)
            4'b0011: result = a >> b[5:0];          // SRL, SRLI (logical right shift)
            4'b0100: result = a >>> b[5:0];         // SRA, SRAI (arithmetic right shift)
            4'b0101: result = a & b;                // AND, ANDI
            4'b0110: result = a | b;                // OR, ORI
            4'b0111: result = a ^ b;                // XOR, XORI
            default: result = 64'b0;                
        endcase
        
        zero = (result == 64'b0) ? 1 : 0;
    end

endmodule
