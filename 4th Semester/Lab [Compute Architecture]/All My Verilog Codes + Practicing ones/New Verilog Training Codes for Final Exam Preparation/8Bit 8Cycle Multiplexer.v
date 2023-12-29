module Multiplexer(input [7:0]A, input [7:0]B, input clk,rst, output reg [15:0]result);


reg [3:0]N;
reg [15:0] A_copy;
reg [15:0] B_copy;


always @(posedge clk)
    begin
      
        if(rst)
            begin
                N = 0;
                A_copy = {8'b0,A};
                B_copy = {B};
                result = 16'b0;

            end
        else if(N<8)
                begin

                    if (B_copy[0]==1)
                        result = result + A_copy;

                    A_copy = A_copy << 1;
                    B_copy = B_copy >> 1;
                    N = N+1;
                end

    end
endmodule
