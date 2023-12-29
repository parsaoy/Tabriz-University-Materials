module FlipFlop_JK(input j,k,clk, output q,q_prim);

	wire s,r;

	nand(r,q_prim,j,clk);
	nand(s,q,k,clk);
	nand(q,r,q_prim);
	nand(q_prim,s,q);

endmodule