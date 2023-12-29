module Conter(input clk,rst ,output reg [15:0]counter);


wire F[3:0];
wire W1,W2;

TFF U1(
    .clk(clk),
    .rst(rst),
    .Q(F[0])
    .T(1'b1)

);

TFF U2(
    .clk(clk),
    .rst(rst),
    .Q(F[1])    
    .T(F[0])
);

and(F[0],F[1],W1);

TFF U3(
    .clk(clk),
    .rst(rst),
    .Q(F[2])
    .T(W1)
);
and(W1,F[2],W2);

TFF U4(
    .clk(clk),
    .rst(rst),
    .Q(F[3])
    .T(W2)
);

endmodule