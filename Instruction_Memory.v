module instruction_memory(input rst, input clk, input [63:0] instr_address, output [63:0] instruction);

    reg [63:0] instr_memory [15:0];  
    integer k;
    assign instruction = instr_memory[instr_address[63:2]];

    always @(posedge clk or posedge rst)
    begin
        if (rst) begin
            for (k = 0; k < 16; k = k + 1) begin 
                instr_memory[k] = 64'h0;  
            end
        end else begin
        
            instr_memory[0] = 32'h00000000;     // no operation
            instr_memory[1] = 32'h00700013;     // addi x0, x0, 7
            instr_memory[2] = 32'h0BA00193;     // addi x3, x0, 186
            instr_memory[3] = 32'h00400693;     // addi x13, x0, 4
            instr_memory[4] = 32'h00D18633;     // add x12, x3, x13
            instr_memory[5] = 32'h00366A33;     // or x20, x12, x3
            instr_memory[6] = 32'h00DA1533;     // sll x10, x20, x13
            instr_memory[7] = 32'h40A503B3;     // sub x7, x10, x10
            instr_memory[8] = 32'h00A02023;     // sd x10, 0(x0)
            instr_memory[9] = 32'h00003C03;     // ld x24, 0(x0)
            instr_memory[10] = 32'h00150A93;    // addi x21, x10, 1
            instr_memory[11] = 32'h015C0463;    // beq x24, x21, L1
            instr_memory[12] = 32'h00150B93;    // addi x23, x10, 1
            instr_memory[13] = 32'h00100063;    // beq x0, x0, END
            instr_memory[14] = 32'h03100B93;    // L1: addi x23, x0, 49
            instr_memory[15] = 32'h00000013;    // END: addi x0, x0, 0
            
        end
    end
endmodule
