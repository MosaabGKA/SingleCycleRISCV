module alu_mux (
    input [63:0] input0,   
    input [63:0] input1,   
    input select,          
    output [63:0] out      
);

    assign out = (select) ? input1 : input0;  

endmodule
