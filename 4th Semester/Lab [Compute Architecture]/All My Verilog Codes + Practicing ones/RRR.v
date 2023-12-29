module RRR(input [3:0]X
,input[3:0]Y
,output [4:0] s);

	assign s = X[3:0]+Y[3:0];

endmodule