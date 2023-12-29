// TestBench for 8-bit Multiplier

module tbEightBitMultiplier;

    reg [7:0] A;
    reg [7:0] B;
    reg S, clk;

    wire [15:0] Output;

    eightBitMultiplier u0(A, B, S, clk, Output);

    always #10 clk = ~clk;

    initial begin

        clk = 0;

        $display("8-bit Multiplier with Repeated Additions\n**-Parsa Yousefi Nejad-**");
        $display("The Second Output in each box is the Output Result");
        $display("  A\tB\tS(EN)\tOutput\t              Time");
        
        $monitor("%d\t%d\t%b\t%d%t", A, B, S, Output, $time);
        $display("--------------------------------------------------------");

        S = 1;
        A = 8'd5;
        B = 8'd8;
        // 5*8 = 40
    #200 // (8+1) * 20  + 20 = 200
        $display("--------------------------------------------------------");
        A = 8'd4;
        B = 8'd1;
        // 4*1 = 4
    #60 // (1+1) *20 + 20 = 30
        $display("--------------------------------------------------------");
        A = 8'd16;
        B = 8'd17;
        // 16*17 = 272
    #380 // (17+1) *20 + 20 = 370
        $display("--------------------------------------------------------");
        A = 8'd35;
        B = 8'd95;
        // 35*95 = 3,465
    #1940 // (96) *20 + 20 = 1940
        $display("--------------------------------------------------------");
        A = 8'd66;
        B = 8'd66;
        // 66*66 = _
/*-->*/ S = 1'b0;
    #1360
        $display("As you see the Multiplication is Disabled.");
        $display("--------------------------------------------------------");

        $stop;
    end

endmodule