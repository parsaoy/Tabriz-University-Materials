module CounterGate(input clk,rst, output [3:0]F);

	wire [3:0]Qp;

	assign Qp = ~F;
	wire w1,w2;
	
	TFF	U1(.clk(clk),.rst(rst),.T(1'b1),.Q(F[0],.Qp(Qp[0])));
	
	TFF	U2(.clk(clk),.rst(rst),.T(F[0]),.Q(F[1],.Qp(Qp[1])));

	and(w1,F[0],F[1]);
	
	TFF	U3(.clk(clk),.rst(rst),.T(w1),.Q(F[2],.Qp(Qp[2])));
	
	and(w2,w1,F[2]);

	TFF	U4(.clk(clk),.rst(rst),.T(w2),.Q(F[3],.Qp(Qp[3])));

	
	
endmodule