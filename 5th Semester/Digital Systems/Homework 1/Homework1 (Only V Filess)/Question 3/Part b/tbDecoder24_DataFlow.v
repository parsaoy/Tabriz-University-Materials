module tbDecoder24_DataFlow;

    reg x, y, E;
    wire [3:0] D;

    Decoder24_DataFlow u0(x, y, E, D);

    initial begin
        E = 0;
        x = 0; y = 0;
    #10
        x = 1; y = 0;
    #10
        x = 0; y = 1;
    #10
        x = 1; y = 1;
    #20
        E = 1;
    #10
        E = 0;
        x = 1; y = 0;
    #10 $stop;
    end

endmodule
// Test Bench for Part b
