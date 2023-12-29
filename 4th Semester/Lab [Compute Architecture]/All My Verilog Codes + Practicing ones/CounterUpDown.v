module CounterUpDown (input clk,rst,X , output reg [3:0] F);

	always @(posedge clk or posedge rst)
		begin
			
			if(rst)	
				F = 4'b0
			else if(~X)
				#50000	F = F+1;
			else if(X)
				#50000 	F = F-1;
		end
	


endmodule