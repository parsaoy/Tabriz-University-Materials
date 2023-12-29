module Counter(input clk,rst, output reg [3:0]F);
reg [3:0] N;

always @(posedge)
    begin
        if(rst)
            F = 0;
        else
            begin
                if (N<15)
                    begin
                        N = N=1;
                        F = F+1;
                    end

            end

    end
endmodule