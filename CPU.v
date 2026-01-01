module RISCV (input clk, rst);

// wires connecting components
wire [63:0] pc_out_wire, pc_next_wire, pc_wire, instruction, read_data1, reg_to_mux, write_back_wire, branch_target, immediate_out_wire, mux_to_alu, read_data_wire, WB_data_wire;
wire reg_write, alu_src, mem_read, mem_write, mem_to_reg, branch, zero;
wire [1:0] alu_op_wire;
wire [3:0] alu_ctrl_wire;

// Program Counter
program_counter program_counter(.clk(clk),.rst(rst),.pc(pc_wire),.next_pc(pc_out_wire));

// PC Adder
pc_plus_4 pc_plus_4(.pc(pc_out_wire),.next_pc(pc_next_wire));

// PC Mux
pc_mux pc_mux(.pc_4(pc_next_wire),.pc_branch(branch_target),.branch(branch&zero),.next_pc(pc_wire));

// Instruction Memory
instruction_memory i_mem(.rst(rst),.clk(clk),.instr_address(pc_out_wire),.instruction(instruction));

// Register File
register_file reg_file(.rst(rst), .clk(clk), .reg_write(reg_write), .Rs1(instruction[19:15]), .Rs2(instruction[24:20]), .Rd(instruction[11:7]), .write_data(WB_data_wire), .read_data1(read_data1), .read_data2(reg_to_mux));

// Control Unit
control_unit cu(.opcode(instruction[6:0]),.reg_write(reg_write),.mem_read(mem_read),.mem_write(mem_write),.mem_to_reg(mem_to_reg),.alu_src(alu_src),.branch(branch),.alu_op(alu_op_wire));

// ALU_Control
alu_control alu_ctrl(.funct3(instruction[14:12]),.funct7(instruction[31:25]),.alu_op(alu_op_wire),.alu_ctrl(alu_ctrl_wire));

// ALU
alu alu(.a(read_data1),.b(mux_to_alu),.alu_control(alu_ctrl_wire),.result(write_back_wire),.zero(zero));

// Immediate Generator
immediate_generator i_gen(.instruction(instruction),.immediate(immediate_out_wire));

// ALU Mux
alu_mux alu_mux(.input0(reg_to_mux),.input1(immediate_out_wire),.select(alu_src),.out(mux_to_alu));

// Data Memory
data_memory d_mem(.clk(clk),.rst(rst),.mem_read(mem_read),.mem_write(mem_write),.address(write_back_wire),.write_data(reg_to_mux),.read_data(read_data_wire));

// Write Back Mux
data_memory_mux WB_mux(.input0(write_back_wire),.input1(read_data_wire),.select(mem_to_reg),.out(WB_data_wire));

// Branch Adder
branch_add branch_add(.pc(pc_out_wire), .offset(immediate_out_wire), .branch_target(branch_target));

endmodule
