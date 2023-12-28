// 1 Arithmetic Unit Cell
module singleAU_cellGateLevel(A, B, cin, s0, s1, cout, D);

    input A, B, cin, s0, s1;
    output cout, D;
    wire multiplexerOutput;
    oneBitfullAdderGateLevel u0(A, multiplexerOutput, cin, cout, D);
    multiplexer41GateLevel   u1(B, ~B, 1'b0, 1'b1, s0, s1, multiplexerOutput);

endmodule