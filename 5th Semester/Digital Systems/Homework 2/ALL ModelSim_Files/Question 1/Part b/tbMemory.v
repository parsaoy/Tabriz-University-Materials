// TestBench for Memory
// Easy Peezy
module tbMemory;

    reg [7:0] Data_in;
    reg [9:0] Address;
    reg wr, rd;
    wire [7:0] Output;

    Memory u0(Data_in, Address, wr, rd, Output);

    initial begin
    // Writing ********
        wr = 1;
        Address = 10'd1023;
        Data_in = 8'd120;
    #10
        Data_in = 8'd31;
        Address = 10'd1;
    // ****************
    #10
    // Reading ********
        wr = 0;
        rd = 1;
        Address = 10'd1023;
    #10
        Address = 10'd1;
    // ****************
    #10
        rd = 0;
    #10
        $stop;
    end
endmodule