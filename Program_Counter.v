module program_counter (
    input clk,
    input rst,
    input [63:0] pc,
    output reg [63:0] next_pc
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            next_pc <= 64'h0;  
        end else begin
            next_pc <= pc;  
        end
    end

endmodule
