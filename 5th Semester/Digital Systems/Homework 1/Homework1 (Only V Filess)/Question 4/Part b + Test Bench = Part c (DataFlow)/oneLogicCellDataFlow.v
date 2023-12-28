module oneLogicCellDataFlow(A, B, s0, s1, D);

    input A, B, s0, s1;
    output D;

    // Part b:
    multiplexer41DataFlow u0(A&B, A|B, A^B, ~A, s0, s1, D);

    // wire y0, y1, y2, y3;

    // and (y0, A, B);
    // or  (y1, A, B);
    // xor (y2, A, B);
    // not (y3, A);

    // multiplexer41DataFlow u0(y0, y1, y2, y3, s0, s1, D);

endmodule