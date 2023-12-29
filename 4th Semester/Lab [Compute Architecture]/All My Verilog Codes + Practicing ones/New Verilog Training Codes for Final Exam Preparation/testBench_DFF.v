`timescale 1ns/1ns
module TBB_DFF;

reg D,clk,rst;
wire Q;

DFU U1(
    .D(D),
    .clk(clk),
    .Q(Q)
);

always #10 clk = ~clk;
initial
    begin
        #5;
        clk = 0;
        
        D = 0;
        #10;

        D = 1;
        #10; 
        rst = 1;
        #10;
        D = 1;
        rst = 0;
        #10;
        D = 0;
    end

endmodule