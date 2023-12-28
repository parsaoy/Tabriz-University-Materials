/* 
    Typical, Maximum, Minimum
    Question 2
 */
module Delayed_Mux21;

    reg in1, in0, s;
    wire outMin, outTyp, outMax;

    bufif1 #(1, 3, 5) (outMin, in1, s);
    bufif0 #(1, 3, 5) (outMin, in0, s);

    bufif1 #(2, 4, 6) (outTyp, in1, s);
    bufif0 #(2, 4, 6) (outTyp, in0, s);

    bufif1 #(3, 5, 7) (outMax, in1, s);
    bufif0 #(3, 5, 7) (outMax, in0, s);

    initial begin

        {in1, in0, s} = 3'b000;
    #10
        {in1, in0, s} = 3'b010;
    #10
        {in1, in0, s} = 3'b100;
    #10
        {in1, in0, s} = 3'b110;
    #10
        {in1, in0, s} = 3'b001;
    #10
        {in1, in0, s} = 3'b011;
    #10
        {in1, in0, s} = 3'b101;
    #10
        {in1, in0, s} = 3'b111;

    end

endmodule    
//Parsa