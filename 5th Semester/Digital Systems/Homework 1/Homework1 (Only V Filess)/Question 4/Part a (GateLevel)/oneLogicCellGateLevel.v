// 1 Logic Cell Gate-Level
module oneLogicCellGateLevel(A, B, s0, s1, D);

    input A, B, s0, s1;
    output D;

    wire y0, y1, y2, y3;

    and (y0, A, B);
    or  (y1, A, B);
    xor (y2, A, B);
    not (y3, A);

    multiplexer41GateLevel u0(y0, y1, y2, y3, s0, s1, D);

endmodule