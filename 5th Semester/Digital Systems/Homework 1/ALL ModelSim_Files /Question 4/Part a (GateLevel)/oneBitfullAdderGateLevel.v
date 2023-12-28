// 1-bit FullAdder Gate-Level
module oneBitfullAdderGateLevel(a, b, cin, cout, sum);

    input a, b, cin;
    output cout, sum;

    wire s1, s2, c1;

    xor(s1, a, b);
    and(c1, a, b);
    xor(sum, s1, cin);
    and(s2, s1, cin);
    or (cout, s2, c1);

endmodule