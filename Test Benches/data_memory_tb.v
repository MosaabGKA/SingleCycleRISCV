module data_memory_tb;
    reg clk;
    reg rst;
    reg mem_read;
    reg mem_write;
    reg [63:0] address;
    reg [63:0] write_data;
    wire [63:0] read_data;
    
    data_memory data_memory (
        .clk(clk),
        .rst(rst),
        .mem_read(mem_read),
        .mem_write(mem_write),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        mem_read = 0;
        mem_write = 0;
        address = 0;
        write_data = 0;
        
        #10 rst = 0;
        
        $display("Testing Data Memory:");
        
        // Test 1: Write to memory
        mem_write = 1;
        address = 64'h10;
        write_data = 64'h123456789ABCDEF0;
        #10;
        $display("Test 1: Write %h to address %h", write_data, address);
        
        // Test 2: Read from memory
        mem_write = 0;
        mem_read = 1;
        address = 64'h10;
        #10;
        $display("Test 2: Read from address %h = %h", address, read_data);
        
        // Test 3: Write to another address
        mem_write = 1;
        mem_read = 0;
        address = 64'h20;
        write_data = 64'hFEDCBA9876543210;
        #10;
        $display("Test 3: Write %h to address %h", write_data, address);
        
        // Test 4: Read from both addresses
        mem_write = 0;
        mem_read = 1;
        address = 64'h10;
        #10;
        $display("Test 4a: Read from address %h = %h", address, read_data);
        
        address = 64'h20;
        #10;
        $display("Test 4b: Read from address %h = %h", address, read_data);
        
        // Test 5: Test reset
        rst = 1;
        mem_read = 1;
        address = 64'h10;
        #10;
        $display("Test 5: After reset, address %h = %h", address, read_data);
        
        $finish;
    end
endmodule