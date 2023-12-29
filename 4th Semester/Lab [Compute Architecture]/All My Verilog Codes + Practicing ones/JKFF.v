module JKFF(input clk,rst,j,k, output reg Q,output Qp);


	assign Qp = ~Q;
	
	always @(posedge clk, negedge rst)	//always run at Positive Edge of Clock pulse and when reset has negative edge
		begin
		
			if(!rst)   Q = 1'b0;
				
			else if(rst)
			
				begin
					
					case({J,k})
						
						2'b11 : Q = Q;
						2'b10 : Q = 1;
						2'b01 : Q = 0;
						2'b00 : Q = Qp;
						
					endcase
				
				end
		
		end



endmodule