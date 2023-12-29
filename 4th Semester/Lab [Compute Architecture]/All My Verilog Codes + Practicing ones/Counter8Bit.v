module Counter8Bit(input clk,rst, output reg [7:0]F);

	
	always	@(posedge clk or negedge rst)
		begin
			
			if(!rst)	F = 3;
			else 
			
				begin
					
					if(F<120)
						F = F+1;
					else if(F>=120)
						F = 3;
				end
			
		end
	

endmodule