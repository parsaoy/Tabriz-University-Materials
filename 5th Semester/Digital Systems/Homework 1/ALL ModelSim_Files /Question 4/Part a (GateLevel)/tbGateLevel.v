/*
    Homework 1-> Question 4-> Part a
    Coded by Parsa Yousefi Nejad
*/
module tbGateLevel;

    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] S;
    reg cin;
    wire Z, cout;
    wire [7:0] D;

    reg [60:0] strings [0:15];
    reg [3:0] iterator;

    GateLevelALU u0(A, B, cin, S, Z, cout, D);

    initial begin

        strings[0]  = "A+B";
        strings[1]  = "A+B+1";
        strings[2]  = "A+B\'";
        strings[3]  = "A+B\'+1";
        strings[4]  = "A";
        strings[5]  = "A+1";
        strings[6]  = "A-1";
        strings[7]  = "A";
        strings[8]  = "A&B";
        strings[9]  = "A|B";
        strings[10] = "A^B";
        strings[11] = "A\'";
        strings[12] = "ShRA";
        strings[13] = "ShLA";
        
        A = 8'd43;
        B = 8'd17;

        $display("Gate-Level ALU\nCoded By: **Parsa Yousefi Nejad**");
        $display("S3\tS2\tS1\tS0\tCin\tFormula\t\tA(#D)\tB(#D)\t D(#D)\tA(#B)   \tB(#B)    \tD(#B)");
        $monitor("%b\t%b\t%b\t%b\t%b\t%S\t%D\t%D\t%D\t%B\t%B\t%B",S[3], S[2], S[1], S[0], cin, strings[iterator], A, B, D, A, B, D);

        iterator = 0; S = 4'b0000; cin = 1'b0;
    #10
        iterator = 1; S = 4'b0000; cin = 1'b1;
    #10
        iterator = 2; S = 4'b0001; cin = 1'b0;
    #10
        iterator = 3; S = 4'b0001; cin = 1'b1;
    #10
        iterator = 4; S = 4'b0010; cin = 1'b0;
    #10
        iterator = 5; S = 4'b0010; cin = 1'b1;
    #10
        iterator = 6; S = 4'b0011; cin = 1'b0;
    #10
        iterator = 7; S = 4'b0011; cin = 1'b1;
    #10
        iterator = 8; S = 4'b0100; cin = 1'bx;
    #10
        iterator = 9; S = 4'b0101; cin = 1'bx;
    #10
        iterator = 10; S = 4'b0110; cin = 1'bx;
    #10
        iterator = 11; S = 4'b0111; cin = 1'bx;
    #10
        iterator = 12; S = 4'b10xx; cin = 1'bx;
    #10
        iterator = 13; S = 4'b11xx; cin = 1'bx;
    
    end

endmodule
// Test Bench For PA Q4 H1