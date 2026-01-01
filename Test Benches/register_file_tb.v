module register_file_tb;
    reg clk;
    reg rst;
    reg reg_write;
    reg [4:0] Rs1;
    reg [4:0] Rs2;
    reg [4:0] Rd;
    reg [63:0] write_data;
    wire [63:0] read_data1;
    wire [63:0] read_data2;
    
    register_file uut (
        .clk(clk),
        .rst(rst),
        .reg_write(reg_write),
        .Rs1(Rs1),
        .Rs2(Rs2),
        .Rd(Rd),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        
        clk = 0;
        rst = 1;
        reg_write = 0;
        Rs1 = 0;
        Rs2 = 0;
        Rd = 0;
        write_data = 0;
        
        #10 rst = 0;
        
        $display("Testing Register File:");
        
        // Test 1: Write to register x1
        reg_write = 1;
        Rd = 5'b00001;
        write_data = 64'h123456789ABCDEF0;
        #10;
        
        // Read from x1
        reg_write = 0;
        Rs1 = 5'b00001;
        #10;
        $display("Test 1: Write %h to x1, Read from x1 = %h", 
                 64'h123456789ABCDEF0, read_data1);
        
        // Test 2: Write to register x10
        reg_write = 1;
        Rd = 5'b01010;
        write_data = 64'hFEDCBA9876543210;
        #10;
        
        // Read from x10 and x1 simultaneously
        reg_write = 0;
        Rs1 = 5'b01010;
        Rs2 = 5'b00001;
        #10;
        $display("Test 2: Read x10 = %h, x1 = %h", read_data1, read_data2);
        
        // Test 3: Write to x0
        reg_write = 1;
        Rd = 5'b00000;
        write_data = 64'h1111111111111111;
        #10;
        
        Rs1 = 5'b00000;
        #10;
        $display("Test 3: Attempt to write to x0 = %h (should be 0)", read_data1);

        $finish;
    end
endmodule