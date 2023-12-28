module singleAU_cellDataFlow(A, B, cin, s0, s1, cout, D);

    input A, B, cin, s0, s1;
    output cout, D;
    wire multiplexerOutput;
    oneBitfullAdderDataFlow u0(A, multiplexerOutput, cin, cout, D);
    multiplexer41DataFlow   u1(B, ~B, 1'b0, 1'b1, s0, s1, multiplexerOutput);

endmodule