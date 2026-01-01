module register_file(input clk, input rst, input reg_write, input [4:0] Rs1, input [4:0] Rs2, input [4:0] Rd, input [63:0] write_data, read_data1, output [63:0] read_data2);

reg [63:0] registers [31:0];
integer k;

always @(negedge clk or posedge rst) begin
if (rst) 
    begin
      for (k = 0; k < 32; k = k + 1) begin
        registers[k] = 64'h0;
      end
    end

    else if (reg_write && (Rd != 5'b0)) begin
      registers[Rd] = write_data;
    end
  end

  assign read_data1 = registers[Rs1];
  assign read_data2 = registers[Rs2];
  
endmodule
