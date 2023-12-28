// Test bench Question 3
module tbBinaryToCommonAnode7Seg;

    reg [3:0] D;
    wire [6:0] Output;
    
    Binary_To_Common_Anode_7Segment u0(D, Output);

    initial begin
        $display("-->>Binary to Common Anode 7 Segment Decoder<<--\n**Coded By: Parsa Yousefi Nejad**");
        $display("Binary\tHex\tBinaryDecoded");
        $monitor("%b\t         %h\t%b", D, D, Output);

        D = 4'd0;
    #5
        D = 4'd1;
    #5
        D = 4'd2;
    #5
        D = 4'd3;
    #5
        D = 4'd4;
    #5
        D = 4'd5;
    #5
        D = 4'd6;
    #5
        D = 4'd7;
    #5
        D = 4'd8;
    #5
        D = 4'd9;
    #5
        D = 4'd10;
    #5
        D = 4'd11;
    #5
        D = 4'd12;
    #5
        D = 4'd13;
    #5
        D = 4'd14;
    #5
        D = 4'd15;
    #5
        $stop;

    end

endmodule