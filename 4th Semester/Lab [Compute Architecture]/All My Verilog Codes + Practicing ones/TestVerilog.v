module TestVerilog(input A,B,C,output F,G);
//Full Adder
	
	
	
	xor (L,A,B);
	xor (F,L,C);
	
	and (P,L,C);
	and (Q,A,B);
	
	or  (G,P,Q);

endmodule