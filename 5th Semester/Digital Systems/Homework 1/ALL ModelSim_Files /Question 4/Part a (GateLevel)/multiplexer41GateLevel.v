// 1-bit Gate-Level 4->1 Multiplexer
module multiplexer41GateLevel(i0, i1, i2, i3, s0, s1, D);

    input i0, i1, i2, i3, s0, s1;
    output D;

    wire y0, y1, y2, y3;


    and(y0, i0, ~s1, ~s0);
    and(y1, i1, ~s1,  s0);
    and(y2, i2,  s1, ~s0);
    and(y3, i3,  s1,  s0);

    or(D, y0, y1, y2, y3);

endmodule