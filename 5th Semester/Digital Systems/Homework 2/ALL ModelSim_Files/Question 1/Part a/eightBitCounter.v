/* 
    8-Bit Counter with Priority
    Question 1
 */
module eightBitCounter(Data_in, INC, Clear, Load, CountEN, clk, Output);

    input [7:0] Data_in;
    input INC, Clear, Load, CountEN, clk;
    output [7:0] Output;
    reg [7:0] Output;

    always @(posedge clk) begin
        if(Clear)
            Output = 8'b0;
        else if(Load)
            Output = Data_in;
        else if (CountEN & INC)
            Output = Output + 1;
        else if (CountEN & !INC)
            Output = Output - 1;
        else
            Output = Output;

    end

endmodule