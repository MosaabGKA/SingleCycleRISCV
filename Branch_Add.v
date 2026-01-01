module branch_add (
    input [63:0] pc,                    
    input [63:0] offset,                
    output reg [63:0] branch_target     
);

    always @(*) begin
        branch_target <= pc + (offset);  
    end

endmodule