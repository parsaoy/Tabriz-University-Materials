module BombCode(input A,output S,C);

	wire GD = 1'b0;
	wire HV = 1'b1;
	
	xor(S,A,HV);//xor(S,A,1'b1);
	
	and(C,A,GD);//xor(C,A,1'b0);

endmodule


