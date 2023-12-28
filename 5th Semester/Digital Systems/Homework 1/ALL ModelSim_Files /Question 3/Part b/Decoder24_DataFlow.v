module Decoder24_DataFlow(x, y, E, D);
        
    input x, y, E;
    output [3:0] D;

    assign D[0] = ~x & ~y & ~E;
    assign D[1] = ~y &  x & ~E;
    assign D[2] = ~x &  y & ~E;
    assign D[3] =  x &  y & ~E;

endmodule

// Part b DataFlow