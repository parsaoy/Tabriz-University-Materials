//module FullAdderWithAssign(input X,Y,W,output Sum,Carry);
module FullAdderWithAssign(input X,Y,W,output [1:0]S);
	/*
	wire L,P,Q; // Optional
	assign L = X^Y;
	assign Sum = L^W;
	assign Q = X&Y;
	assign Carry = P|Q;
	*/			
	
	//better way
	
	//first Approach
	/*
	assign Sum = (X^Y)^W;
	assign Carry = ((x^y)&W)|(X&Y);
	*/
	//Second Approach
	
	assign S[0] = (X^Y)^W;
	assign S[1] = ((X^Y)&W)|(X&Y);

	//Third Approach
	//assign SUM = X+Y+Z		// output [1:0] SUM
	
endmodule

//assign F = &(A); 	It ANDs all Bits of A
//assign F = ~&(A)  = valid syntax for NAND
//assign F = &({X,Y,Z,K})  =  X & Y & Z & K    // Adjoint