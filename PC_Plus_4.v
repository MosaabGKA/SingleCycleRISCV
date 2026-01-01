module pc_plus_4 (
    input [63:0] pc,
    output reg [63:0] next_pc
);

    always @(*) begin
        next_pc = pc + 4;
    end

endmodule
