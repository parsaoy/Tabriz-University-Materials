module peculiarCounter(input clk,rst, output reg [7:0]F);

	reg [4:0] MEM [5:0];
	reg [2:0] i;
	
	
	always @(posedge clk or posedge rst)
		begin
		
			if(rst)	
			
				begin
					i = 0;
					
					MEM[0] = 13;
					MEM[1] = 15;
					MEM[2] = 17;
					MEM[3] = 17;
					Mem[4] = 45;	
				end
				
				
			else
			
				begin
				
					if(i < 4)
						i = i+1;
					
					else
						i = 0;
				end
				
				
		F = MEM[i];
		
		end

endmodule