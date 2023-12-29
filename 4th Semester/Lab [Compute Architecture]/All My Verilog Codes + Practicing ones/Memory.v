module Memory(input [7:0] Data_in , input Rd,Wr, input [11:0] Address, output [7:0] Data_out);

	reg	[7:0]	Memory [4095:0];
	
	
	initial
	begin		//Memory Musn't be WIRE, it must be REG
		Wr = 1;
		Rd = 0;
		Memory[82] = 232;
	end
	
// assign	Data_out = (Rd)? (Memory[Address]) : 8'bz;
//	assign 	Memory[Address] ? (Wr) ? Data_in : 		Wrong Approach

	always  @(*)
	begin
		if(Wr)
			Memory[Address] = Data_in;
			
		else if(Rd == 1)
			Data_out = Memory[Address];
		else
			Data_out = 8'bz;
	end
endmodule