// 8-bit Logical Cell
module eightBitLogicCellGateLevel(A, B, S, D);
    input [7:0] A;
    input [7:0] B;
    input [1:0] S;
    output [7:0] D;

    genvar i; 

    generate
        for(i=0; i<8; i=i+1) begin
            oneLogicCellGateLevel u(A[i], B[i], S[0], S[1], D[i]);
        end

    endgenerate

    
// Long approach:
/*     oneLogicCellGateLevel u0(A[0], B[0], S[0], S[1], D[0]);
    oneLogicCellGateLevel u1(A[1], B[1], S[0], S[1], D[1]);
    oneLogicCellGateLevel u2(A[2], B[2], S[0], S[1], D[2]);
    oneLogicCellGateLevel u3(A[3], B[3], S[0], S[1], D[3]);
    oneLogicCellGateLevel u4(A[4], B[4], S[0], S[1], D[4]);
    oneLogicCellGateLevel u5(A[5], B[5], S[0], S[1], D[5]);
    oneLogicCellGateLevel u6(A[6], B[6], S[0], S[1], D[6]);
    oneLogicCellGateLevel u7(A[7], B[7], S[0], S[1], D[7]); */

endmodule
// Coded By Parsa Yousefi Nejad