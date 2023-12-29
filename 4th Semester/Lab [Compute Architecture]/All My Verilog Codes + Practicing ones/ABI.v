module ABI(input [2:0]A,input [2:0]B, output [2:0]F);

	exampleTWO U1(
	
	.A (A[0]),
	.B (B[0]),
	.C (1'b0),
	
	.F (F[0])
	);

	exampleTWO U2(
	
	.A (A[1]),
	.B (B[1]),
	.C (F[0]),
	
	.F (F[1])
	);
	
	
	exampleTWO U3(
	
	.A (A[2]),
	.B (B[2]),
	.C (F[1]),
	
	.F (F[2])
	);
	
endmodule