/* Question 1 Part a */
// TestBench for 8-bit Counter
// <<Parsa Yousefi Nejad>>
module tbEighBitCounter;

    reg [7:0] Data_in;
    reg INC, Clear, Load, CountEN, clk;
    wire [7:0] Output;

    eightBitCounter u0(Data_in, INC, Clear, Load, CountEN, clk, Output);

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        Clear = 1'b0;
        Data_in = 8'd63;
    #10
        Load = 1'b1;
    #10
        Load = 1'b0;
        CountEN = 1'b1;
        INC = 1'b1;
    #30
        INC = 1'b0;
    #40
        CountEN = 1'b0;
    #20
        Load = 1'b1;
        Data_in = 8'd254;
    #10
        Load = 1'b0;
        CountEN = 1'b1;
        INC = 1'b1;
    #40
        Clear = 1'b1;
    #20
        $stop;

        
    end
endmodule