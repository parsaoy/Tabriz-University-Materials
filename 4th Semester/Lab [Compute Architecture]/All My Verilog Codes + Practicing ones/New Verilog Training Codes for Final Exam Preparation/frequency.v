module changeFrequency(input clk, output reg Out);

// 1 to 1/2. (divide clk by 2)
/* always @(posedge clk)
begin

    if(rst)
        out = 0;

    else
        out = ~out;

end */


// 1 to 1/16 (divide clk cycles by 16)
// 16 cycles vs 1 cycle
/* reg [4:0]i;

always @(posedge clk)
begin
    if(rst)
    begin
        out = 0;
        i = 0;
    end
    else
        begin
     
            i = i+1;

            if (i == 8)
                begin
                    out = ~out;
                    i = 0;
                end

        end
end */

// 1 to 1/16 with 75% duty Cycle;
// in 75% of the time, the cycle is ON

reg [4:0]i;
always @(posedge clk)
begin
    if(rst)
    begin
        out = 0;
        i = 0;
    end
    else
    begin
        i = i+1
        if (i == 4 || i ==16)
            out = ~out;
        
        if (i == 16)
            i = 1'b0;
    end
end

endmodule