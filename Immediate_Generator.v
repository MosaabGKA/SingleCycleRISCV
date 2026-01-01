module immediate_generator (
    input [31:0] instruction,    
    output reg [63:0] immediate
);

    always @(*) begin
        case (instruction[6:0]) 

	    7'b0010011: immediate = {{52{instruction[31]}}, instruction[31:20]}; // I-type  
            7'b0000011: immediate = {{52{instruction[31]}}, instruction[31:20]}; // Load-type
            7'b0100011: immediate = {{52{instruction[31]}}, instruction[31:25], instruction[11:7]}; // Store-type
            7'b1100011: immediate = {{51{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // B-type 
            7'b1101111: immediate = {{43{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0}; // J-type
 
            default: immediate = 64'h0;
        endcase
    end

endmodule