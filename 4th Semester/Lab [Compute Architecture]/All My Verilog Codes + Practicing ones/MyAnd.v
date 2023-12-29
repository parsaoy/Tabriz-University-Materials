module MyAnd(input A,B, output C);


	assign C = A&B;   // C must be Wire , no Reg, 	inputs are always Wire



endmodule