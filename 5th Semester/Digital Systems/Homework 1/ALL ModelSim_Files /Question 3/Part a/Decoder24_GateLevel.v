module Decoder24_GateLevel(x, y, E, D);
        
    input x, y, E;
    output [3:0] D;

    and(D[0], ~x, ~y, ~E);
    and(D[1], ~y, x, ~E);
    and(D[2], ~x, y, ~E );
    and(D[3], x, y, ~E);


endmodule
// Part a