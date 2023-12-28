// Gate-Level ALUE
module GateLevelALU(A, B, cin, S, Z, cout, D);

    input [7:0] A;
    input [7:0] B;
    input [3:0] S;
    input cin;
    output Z, cout;
    output [7:0] D;

    wire [7:0] I0;
    wire [7:0] I1;

    eightBitAU_GateLevel u0(A, B, cin, S[1:0], Z, cout, I0);
    eightBitLogicCellGateLevel u1(A, B, S[1:0], I1);
    eightBitMultiplexer41GateLevel u2(I0, I1, {1'b0,A[7:1]}, {A[6:0],1'b0}, S[2], S[3], D);

endmodule
// Coded by <<Parsaoy>>