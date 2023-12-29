module fourBitFullAdderWithModule(input [3:0]A, input [3:0]B,input Cin, output [4:0]F);

	//Very Simple Approach:
	//assign F = Cin==0? A+B : A-B
	
	//Bnew = B ^ 4'b1111		in order to negate
	
	//wire C1,C2,C3;

	oneBitFullAdder U1(
	.a(A[0]),
	.b(B[0]),
	.cin(Cin),
	
	.sum(F[0]),
	.carry(C1)
	);

		oneBitFullAdder U2(
	.a(A[1]),
	.b(B[1]),
	.cin(C1),
	
	.sum(F[1]),
	.carry(C2)
	);
	
		oneBitFullAdder U3(
	.a(A[2]),
	.b(B[2]),
	.cin(C2),
	
	.sum(F[2]),
	.carry(C3)
	);
	
		oneBitFullAdder U4(
	.a(A[3]),
	.b(B[3]),
	.cin(C3),
	
	.sum(F[3]),
	.carry(F[4])
	);

endmodule