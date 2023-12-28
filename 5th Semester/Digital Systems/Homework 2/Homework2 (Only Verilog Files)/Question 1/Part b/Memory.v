// Simple Memory with wr and rd control ports
// Question 1 Pb
module Memory(Data_in, Address, wr, rd, Output);

    input [7:0] Data_in;
    input [9:0] Address;
    input wr, rd;
    output [7:0] Output;
    reg [7:0] Output;

    reg [7:0] memory [1023:0];

    always @(*) begin

        if(wr) 
            memory[Address] = Data_in;
        else if(rd) 
            Output = memory[Address];
    end
endmodule