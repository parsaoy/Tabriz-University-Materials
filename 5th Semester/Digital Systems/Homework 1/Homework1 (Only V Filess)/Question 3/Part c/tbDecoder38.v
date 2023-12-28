/*
Homework 1: Question 3 -> Part C
Coded By Parsa Youefi Nejad
*/
module tbDecoder38;

    reg x, y, z;
    wire [7:0] D;
    Decoder38 u0(x, y, ~z, D);
    initial begin
        $display("3to8 Decoder using 2to4 decoders\n**Parsa Yousefi Nejad**");
        $display("z\ty\tx|\t\tD7\tD6\tD5\tD4\tD3\tD2\tD1\tD0");
        $display("----------------------------------------------------------------------------------------------------");
        $monitor("%b\t%b\t%b|\t\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",z, y, x, D[7],D[6],D[5],D[4],D[3],D[2],D[1],D[0]);
              z = 0; y = 0; x = 0;
        #5    z = 0; y = 0; x = 1;
        #5    z = 0; y = 1; x = 0;
        #5    z = 0; y = 1; x = 1;
        #5    z = 1; y = 0; x = 0;
        #5    z = 1; y = 0; x = 1;
        #5    z = 1; y = 1; x = 0;
        #5    z = 1; y = 1; x = 1;
    end
endmodule