module Decoder38(x, y, z, D);
        
    input x, y, z;
    output [7:0] D;

    Decoder24_DataFlow u0(x, y, ~z, D[3:0]);
    Decoder24_DataFlow u1(x, y,  z, D[7:4]);

endmodule

// Decoder 3 to 8 using two Decoder 24
// Part c