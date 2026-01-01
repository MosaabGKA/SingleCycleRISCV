module data_memory (
    input clk,               
    input rst,               
    input mem_read,           
    input mem_write,          
    input [63:0] address,    
    input [63:0] write_data, 
    output[63:0] read_data 
);
  reg [31:0] data_memory [31:0];
  integer k;
  assign read_data = (mem_read) ? data_memory[address[31:2]] : 64'h0;

  always @(posedge clk or posedge rst) begin
    if (rst ) begin
      for (k = 0; k < 64; k = k + 1) begin
        data_memory[k] = 64'h0;
      end
    end else if (mem_write) begin
      data_memory[address] = write_data;
    end
  end

endmodule
