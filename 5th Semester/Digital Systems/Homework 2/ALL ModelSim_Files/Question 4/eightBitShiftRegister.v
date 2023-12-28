// 8-bit Universal Shift Register
// Question 4
module eightBitShiftRegister(Data_in, Serial_in, Op, clk, Serial_out, Output);

    input [7:0] Data_in;
    input Serial_in, clk;
    input [2:0] Op;

    output Serial_out;  reg Serial_out;
    output [7:0] Output; reg [7:0] Output;

    always @(posedge clk) begin
        case(Op)
            // Set to FF
            3'd0: Output <= 8'hFF;
            // Shift Left
            3'd1: begin Output <= {Output[6:0], Serial_in}; Serial_out <= Output[7]; end
            // Rotate Left
            3'd2: Output <= {Output[6:0], Output[7]};
            // Shift Right Logical
            3'd3: begin Output <= {Serial_in, Output[7:1]}; Serial_out <= Output[0]; end
            // Shift Right Arithmetic
            3'd4: begin Output <= {Output[7], Output[7:1]}; Serial_out <= Output[0]; end
            // Rotate Right
            3'd5: Output <= {Output[0], Output[7:1]};
            // Parallel Load
            3'd6: Output <= Data_in;
            // Clear
            3'd7: begin Output <= 8'h00; Serial_out <= 1'b0; end
        endcase
    end
endmodule
// Coded By Parsaoy