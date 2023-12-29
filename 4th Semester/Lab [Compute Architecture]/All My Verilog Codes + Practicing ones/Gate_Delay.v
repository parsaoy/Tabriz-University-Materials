module Gate_Delay(input A,B, output X);
/*
	and #(2)(X,A,B)// Symmetric Delay
	
	and #(5,2)(X,A,B)//Asymmetric Delay , Rise=5=Being High and Fall=Being Low = 0
	
	and #(5,2,3)(X,A,B)// 3ns = High Impedance Delay


	assign #4 X = ((A&B)^A) | B;
	*/
endmodule