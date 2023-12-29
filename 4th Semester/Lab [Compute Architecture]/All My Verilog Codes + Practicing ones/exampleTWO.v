module exampleTWO(input A,B,C, output F);

	wire T1,T2;
	
	and(T1,C,A);
	and(T2,T1,B);
	or(F,T1,T2);

	
endmodule