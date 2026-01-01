module control_unit_tb;
    reg [6:0] opcode;
    wire reg_write;
    wire mem_read;
    wire mem_write;
    wire mem_to_reg;
    wire alu_src;
    wire branch;
    wire [1:0] alu_op;
    
    control_unit control_unit (
        .opcode(opcode),
        .reg_write(reg_write),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .mem_to_reg(mem_to_reg),
        .alu_src(alu_src),
        .branch(branch),
        .alu_op(alu_op)
    );
    
    initial begin
        $display("Testing Control Unit:");
        $display("opcode | reg_write | mem_read | mem_write | mem_to_reg | alu_src | branch | alu_op");
        $display("-------------------------------------------------------------------------------");
        
        // Test R-type (0110011)
        opcode = 7'b0110011;
        #10;
        $display("R-type  | %b        | %b       | %b        | %b         | %b      | %b     | %b",
                 reg_write, mem_read, mem_write, mem_to_reg, alu_src, branch, alu_op);
        
        // Test I-type (0010011)
        opcode = 7'b0010011;
        #10;
        $display("I-type  | %b        | %b       | %b        | %b         | %b      | %b     | %b",
                 reg_write, mem_read, mem_write, mem_to_reg, alu_src, branch, alu_op);
        
        // Test Load (0000011)
        opcode = 7'b0000011;
        #10;
        $display("Load    | %b        | %b       | %b        | %b         | %b      | %b     | %b",
                 reg_write, mem_read, mem_write, mem_to_reg, alu_src, branch, alu_op);
        
        // Test Store (0100011)
        opcode = 7'b0100011;
        #10;
        $display("Store   | %b        | %b       | %b        | %b         | %b      | %b     | %b",
                 reg_write, mem_read, mem_write, mem_to_reg, alu_src, branch, alu_op);
        
        // Test Branch (1100011)
        opcode = 7'b1100011;
        #10;
        $display("Branch  | %b        | %b       | %b        | %b         | %b      | %b     | %b",
                 reg_write, mem_read, mem_write, mem_to_reg, alu_src, branch, alu_op);
        
        // Test default
        opcode = 7'b1111111;
        #10;
        $display("Default | %b        | %b       | %b        | %b         | %b      | %b     | %b",
                 reg_write, mem_read, mem_write, mem_to_reg, alu_src, branch, alu_op);
        
        $finish;
    end
endmodule
