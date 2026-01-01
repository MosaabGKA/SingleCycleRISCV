module pc_mux(
    input [63:0] pc_4,
    input [63:0] pc_branch,
    input branch,
    output reg[63:0] next_pc
);
    always @(*) begin
        if (branch == 1'b0) begin
            next_pc = pc_4;  
        end else begin
            next_pc = pc_branch;      
        end
    end

endmodule
