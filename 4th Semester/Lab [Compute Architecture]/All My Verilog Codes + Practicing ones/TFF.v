module TFF(input clk, rst, T, output reg Q, output Qp);

	assign Qp = ~Q;
	
	always @(posedge clk or posedge rst)
		begin
		
			if(rst==1)
				Q = 1'b0;
			else if(!rst)
				begin 
					
					if(!T)
						Q = Q;
					else if(T==1)
						Q = ~Q;
				end
		end
	
endmodule