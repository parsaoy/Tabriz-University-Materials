module oneBitFullAdder(input a,b,cin, output sum,carry);


	assign {Carry, sum} = a+b+cin;


/*
	xor (L,A,B);
	xor (Sum,L,C);
	
	and (P,L,C);
	and (Q,A,B);
	
	or  (Carry,P,Q);

*/
	
endmodule