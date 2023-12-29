module TFF(input clk,rst,T, ouput reg = Q);

always @(posedge clk)
    begin
        if(rst)
            Q = 0;
        else
            begin
                case(T)
                0: Q = Q;
                1: Q = ~Q;
                endcase
            end
    end
    
endmodule