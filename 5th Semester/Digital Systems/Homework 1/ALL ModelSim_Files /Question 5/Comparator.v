/* Question 5 */
module Comparator;

    // The Maximum Number could be 2^8 - 1 = 255 (unsigned)
    reg [7:0] A;
    reg [7:0] B;

    wire AeqB, AltB, AgtB;

    // DataFlow means <assign>
    assign AeqB = (A==B)? 1'b1 : 1'b0;
    assign AltB = (A<B)  ? 1'b1 : 1'b0;
    assign AgtB = (A>B) ? 1'b1 : 1'b0;

    initial begin

        $display("A\tB\t|AeqB\tAltB\tAgtB");
        $monitor("%d\t%d\t|%b\t%b\t%b", A, B, AeqB, AltB, AgtB);
// ---------------------------------------
        A = 8'd210; B = 8'd210;
    #10
        A = 8'd110; B = 8'd10;
    #10
        A = 8'd60; B = 8'd93;
    #10
        A = 8'd66; B = 8'd67;
    #10
        A = 8'd75; B = 8'd85;
    #10
        A = 8'd95; B = 8'd95;
    #10
       $stop; 
// ---------------------------------------

    end

endmodule