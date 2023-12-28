// 8-bit Multiplier with Repeated Addition From ASM chart
// Homework 2 -> Question 5

module eightBitMultiplier (A, B, S, clk, Output);

    input [7:0] A;
    input [7:0] B;
    input S, clk;

    output [15:0] Output;
    reg [15:0] Output;

    reg [7:0] RA;
    reg [7:0] RB;
    reg [15:0] RP;

    reg state = 1'b0; 

    always @(posedge clk) begin
        case(state)
            1'b0: 
                if(S == 1'b1) begin
                    RA <= A;
                    RB <= B;
                    RP <= 16'b0;
                    state <=1'b1;
                end
            
            1'b1:
                if(RB != 8'b0) begin
                    RP <= RP + RA;
                    RB <= RB - 1;  
                end

                else begin
                    Output = RP;
                    state <= 0;
                end
                
        endcase
    end

endmodule
// Coded By Parsa Yousefi Nejad