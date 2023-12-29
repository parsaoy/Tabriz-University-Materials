'timescale 1ns/1ps

module SubtractorWithFullAdderModule(input [3:0]A, input [3:0]B, output [4:0]F);

module fourBitFullAdderWithModule();

	//Cin Must be 1

	oneBitFullAdder U1(
	.a(A[0]),
	.b(~B[0]),
	.cin(1),
	
	.sum(F[0]),
	.carry(C1)
	);

		oneBitFullAdder U2(
	.a(A[1]),
	.b(~B[1]),
	.cin(C1),
	
	.sum(F[1]),
	.carry(C2)
	);
	
		oneBitFullAdder U3(
	.a(A[2]),
	.b(~B[2]),
	.cin(C2),
	
	.sum(F[2]),
	.carry(C3)
	);
	
		oneBitFullAdder U4(
	.a(A[3]),
	.b(~B[3]),
	.cin(C3),
	
	.sum(F[3]),
	.carry(F[4])
	);

endmodule











