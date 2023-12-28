/*	Homework 1: Quesiton 1
	Coded by Parsa Yousefi Nejad  */
module Display_Monitor;

	reg i;
	
/*----------------------------------------AND Gate----------------------------------*/	
	wire 	andOut0, andOut1, andOut2, andOut3;
	
	assign andOut0 = i & 1'b0;
	assign andOut1 = i & 1'b1;
	assign andOut2 = i & 1'bx;
	assign andOut3 = i & 1'bz;
	
	initial
	begin

	$display("Homewrok 1: Question 1\n**Parsa Yousefi Nejad**");

	$display("**4-Level AND (&) Gate Truth Table**");
	$display(" |\t0\t1\tx\tz");
	$display("-------------------------------------");
	$monitor("%b|\t%b\t%b\t%b\t%b",i,andOut0,andOut1,andOut2,andOut3);
	i = 1'b0;
	#5 i = 1'b1;
	#5 i = 1'bx;
	#5 i = 1'bz;
	
	end
/*----------------------------------------------------------------------------------*/

/*----------------------------------------XOR Gate----------------------------------*/
	wire 	xorOut0, xorOut1, xorOut2, xorOut3;
	
	assign xorOut0 = i ^ 1'b0;
	assign xorOut1 = i ^ 1'b1;
	assign xorOut2 = i ^ 1'bx;
	assign xorOut3 = i ^ 1'bz;

	initial
	begin
	#25
	$display("\n**4-Level XOR (^) Gate Truth Table**");
	$display(" |\t0\t1\tx\tz");
	$display("-------------------------------------");
	$monitor("%b|\t%b\t%b\t%b\t%b",i,xorOut0,xorOut1,xorOut2,xorOut3);
	i = 1'b0;
	#5 i = 1'b1;
	#5 i = 1'bx;
	#5 i = 1'bz;
	
	end

/*----------------------------------------------------------------------------------*/

/*-------------------------------------bufif0 Gate----------------------------------*/
	wire 	bufifOut0, bufifOut1, bufifOut2, bufifOut3;
	
	bufif0 (bufifOut0,i,1'b0);
	bufif0 (bufifOut1,i,1'b1);
	bufif0 (bufifOut2,i,1'bx);
	bufif0 (bufifOut3,i,1'bz);

	initial
	begin
	#45
	$display("\n**4-Level bufif0 Gate Truth Table**");
	$display(" |\t0\t1\tx\tz");
	$display("-------------------------------------");
	$monitor("%b|\t%b\t%b\t%b\t%b",i,bufifOut0,bufifOut1,bufifOut2,bufifOut3);
	i = 1'b0;
	#5 i = 1'b1;
	#5 i = 1'bx;
	#5 i = 1'bz;
	
	end


/*----------------------------------------------------------------------------------*/

/*-------------------------------------notif1 Gate----------------------------------*/
	wire 	notif1Out0, notif1Out1, notif1Out2, notif1Out3;
	
	notif1 (notif1Out0,i,1'b0);
	notif1 (notif1Out1,i,1'b1);
	notif1 (notif1Out2,i,1'bx);
	notif1 (notif1Out3,i,1'bz);

	initial
	begin
	#75
	$display("\n**4-Level notif1 Gate Truth Table**");
	$display(" |\t0\t1\tx\tz");
	$display("-------------------------------------");
	$monitor("%b|\t%b\t%b\t%b\t%b",i,notif1Out0,notif1Out1,notif1Out2,notif1Out3);
	i = 1'b0;
	#5 i = 1'b1;
	#5 i = 1'bx;
	#5 i = 1'bz;
	
	end
	

endmodule