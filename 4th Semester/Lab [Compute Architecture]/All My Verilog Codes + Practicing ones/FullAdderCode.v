module FullAdderCode(input wire A,B,C,output Sum,Carry);
//Full Adder
	
	wire L,P,Q;//For beauty
	
	xor (L,A,B);
	xor (Sum,L,C);
	
	and (P,L,C);
	and (Q,A,B);
	
	or  (Carry,P,Q);

endmodule