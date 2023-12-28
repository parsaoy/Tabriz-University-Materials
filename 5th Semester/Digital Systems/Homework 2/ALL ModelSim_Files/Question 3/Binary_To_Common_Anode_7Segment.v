// Question 3
// via GPT-3.5
module Binary_To_Common_Anode_7Segment(D, Output);
        
    input [3:0] D;
    output [6:0] Output;
    reg [6:0] Output;

    always @(*) begin
        case (D)
            // Binary: 0000 -> Display: 0 (Segments: a, b, c, d, e, f)
            4'b0000: Output = 7'b1000000;

            // Binary: 0001 -> Display: 1 (Segments: b, c)
            4'b0001: Output = 7'b1111001;

            // Binary: 0010 -> Display: 2 (Segments: a, b, d, e, g)
            4'b0010: Output = 7'b0100100;

            // Binary: 0011 -> Display: 3 (Segments: a, b, c, d, g)
            4'b0011: Output = 7'b0110000;

            // Binary: 0100 -> Display: 4 (Segments: b, c, f, g)
            4'b0100: Output = 7'b0011001;

            // Binary: 0101 -> Display: 5 (Segments: a, c, d, f, g)
            4'b0101: Output = 7'b0010010;

            // Binary: 0110 -> Display: 6 (Segments: a, c, d, e, f, g)
            4'b0110: Output = 7'b0000010;

            // Binary: 0111 -> Display: 7 (Segments: a, b, c)
            4'b0111: Output = 7'b1111000;

            // Binary: 1000 -> Display: 8 (Segments: a, b, c, d, e, f, g)
            4'b1000: Output = 7'b0000000;

            // Binary: 1001 -> Display: 9 (Segments: a, b, c, d, f, g)
            4'b1001: Output = 7'b0010000;

            // Binary: 1010 -> Display: A (Segments: a, b, c, e, f, g)
            4'b1010: Output = 7'b0001000;

            // Binary: 1011 -> Display: B (Segments: c, d, e, f, g)
            4'b1011: Output = 7'b0000011;

            // Binary: 1100 -> Display: C (Segments: a, d, e, f)
            4'b1100: Output = 7'b1000110;

            // Binary: 1101 -> Display: D (Segments: b, c, d, e, g)
            4'b1101: Output = 7'b0100001;

            // Binary: 1110 -> Display: E (Segments: a, d, e, f, g)
            4'b1110: Output = 7'b0000110;

            // Binary: 1111 -> Display: F (Segments: a, e, f, g)
            4'b1111: Output = 7'b0001110;

            // Default: Turn off all segments (display nothing)
            default: Output = 7'b1111111;
        endcase
    end
endmodule
