module universalShiftRegister(input [1:0]LR, input [7:0]A,input clk,rst,input Left_Input,Right_input, output reg[7:0]result);
// Left Shift = LR = 10
// Right Shift = LR = 01
always @(posedge clk)
    begin
        if(rst)
            result = 0
        else
            begin

                case(LR)
                0: result = result;
                1: result = {Right_input,A[7:1]};
                2: result = {A[6:0],Left_Input};
                3: result = A;
                endcase

            end

    end
endmodule