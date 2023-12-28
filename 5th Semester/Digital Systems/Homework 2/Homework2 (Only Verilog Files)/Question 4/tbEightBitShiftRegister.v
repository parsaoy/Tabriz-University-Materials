// Test Bench for 8-bit Shift Register
module tbEightBitShiftRegiter;

    reg [7:0] Data_in;
    reg Serial_in, clk;
    reg [2:0] Op;

    wire Serial_out;
    wire [7:0] Output;

    reg [100:0] strings [0:7];
    reg [2:0] iterator;


    eightBitShiftRegister u0(Data_in, Serial_in, Op, clk, Serial_out, Output);

    always #10 clk = ~clk;
    initial begin

        strings[0] <= "Set to FF";
        strings[1] <= "Shift Left";
        strings[2] <= "Rotate Left";
        strings[3] <= "Sh R Logical";
        strings[4] <= "Sh R Arithm";
        strings[5] <= "Rotate Right";
        strings[6] <= "Parllel Load";
        strings[7] <= "Clear";

        $display("<<8-bit Universal Shift Register>>\n**Parsa Yousefi Nejad**");
        $display("OP2\tOP1\tOP0\tData_in\tSerial_in\tOutput\tSerial_out\tFunction");
        $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%s",Op[2], Op[1], Op[0], Data_in,Serial_in, Output, Serial_out, strings[iterator]);

        clk <= 0;
// set to FF
        Op <= 3'd0;
        iterator <= 0;
        Serial_in <= 1'b0;
    #10
// Shift Right Logical
        Op <= 3'd3;
        iterator <=3;
    #60
// Parallel load
        Data_in <= 8'b10010101;
        Op <= 3'd6;
        iterator <= 6;
    #20
// Rotate Left
        Op <= 3'd2;
        iterator <= 2;
    #40
// Shift Left
        Serial_in <= 1'b1;
        Op <= 3'd1;
        iterator <= 1;
    #40
// Shift right Arithmetic
        Serial_in <= 1'b0;
        Op <= 3'd4;
        iterator <= 4;
    #40
// Clear
        Op <= 3'd7;
        iterator <= 7;
    #20
// Parallel Load
        Data_in <= 8'b10000000;
        Op <= 3'd6;
        iterator <= 6;
    #20
// Rotate Right
        Op <= 3'd5;
        iterator <= 5;
    #60
// Set to 0xFF
        Op <= 3'd0;
        iterator <= 0;
    #20
// Clear
        Op <= 3'd7;
        iterator <= 7;
    #30
        $stop;
    
    end

endmodule
// By Parsaoy