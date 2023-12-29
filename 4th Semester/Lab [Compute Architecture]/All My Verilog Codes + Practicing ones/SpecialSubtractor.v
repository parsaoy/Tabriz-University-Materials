module SpecialSubtractor(input [3:0]X, input [3:0]Y,output H);

	wire [4:0]P;
	subtractModule  EEE(.X(X),.Y(Y),.T(P));

	assign H = P[2]|Y[0];
	//or(H,P[2],Y[0]);

endmodule

