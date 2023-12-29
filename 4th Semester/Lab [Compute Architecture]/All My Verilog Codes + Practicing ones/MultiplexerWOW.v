module MultiplexerWOW(input [3:0] X,input [1:0] S,output Out);
	
	//First Approach
	/*
	assign Out = (S[0])? ((S[1])? X[3] : X[1]) : ((S[1])? X[2] : X[0]);
	*/
	
	//Second Approach
	assign Out = (S[0] == S[1] == 0) ? X[0] : (S[0]==1 && S[1] == 0) ? X[1] : (S[0]==0 && S[1]==1) ? X[3] :(S[0]==1 && S[1] == 1)? X[3]:1'b0; // else 0
	
	//Third Approach
	assign Out = (S==0)? X[0] : (S==1)? X[1]: (S==2)? X[2] : (S==3)? X[3]: 0;
				
endmodule