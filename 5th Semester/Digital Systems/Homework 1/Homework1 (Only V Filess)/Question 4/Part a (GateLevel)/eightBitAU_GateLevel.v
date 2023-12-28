// 8-bit Arithmetic Unit

module eightBitAU_GateLevel(A, B, cin, S, Z, cout, D);

    input [7:0] A;
    input [7:0] B;
    input cin;
    input [1:0] S;
    output Z, cout;
    output [7:0] D;

    wire cout0 ,cout1, cout2, cout3, cout4, cout5, cout6;

    singleAU_cellGateLevel u0(A[0], B[0], cin,   S[0], S[1], cout0, D[0]);
    singleAU_cellGateLevel u1(A[1], B[1], cout0, S[0], S[1], cout1, D[1]);
    singleAU_cellGateLevel u2(A[2], B[2], cout1, S[0], S[1], cout2, D[2]);
    singleAU_cellGateLevel u3(A[3], B[3], cout2, S[0], S[1], cout3, D[3]);
    singleAU_cellGateLevel u4(A[4], B[4], cout3, S[0], S[1], cout4, D[4]);
    singleAU_cellGateLevel u5(A[5], B[5], cout4, S[0], S[1], cout5, D[5]);
    singleAU_cellGateLevel u6(A[6], B[6], cout5, S[0], S[1], cout6, D[6]);
    singleAU_cellGateLevel u7(A[7], B[7], cout6, S[0], S[1], cout,  D[7]);


    nor(Z, D[0], D[1], D[2], D[3], D[4], D[5], D[6], D[7]);

endmodule