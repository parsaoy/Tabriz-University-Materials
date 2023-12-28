module multiplexer41DataFlow(i0, i1, i2, i3, s0, s1, D);

    input i0, i1, i2, i3, s0, s1;
    output D;


    // Dataflow Approach (Part b)
    assign D = ({s1,s0} == 2'b00)? i0 : ({s1,s0} == 2'b01)? i1 : ({s1,s0} == 2'b10)? i2 : i3;


    // Previous Part
    // wire y0, y1, y2, y3;


    // and(y0, i0, ~s1, ~s0);
    // and(y1, i1, ~s1,  s0);
    // and(y2, i2,  s1, ~s0);
    // and(y3, i3,  s1,  s0);


    // or(D, y0, y1, y2, y3);

endmodule