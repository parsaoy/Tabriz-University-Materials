// Test bench for Normal Encoder 8->3
module tbNormal_Encoder83;

    reg [7:0] Data_in;
    wire [2:0] codeOut;


    Normal_Encoder83 u0(Data_in, codeOut);

    initial begin
        $display("Data_in\tcodeOut");
        $monitor("%b\t%b", Data_in, codeOut);

        Data_in = 8'd1;
    #5
        Data_in = 8'd2;
    #5
        Data_in = 8'd4;
    #5
        Data_in = 8'd8;
    #5
        Data_in = 8'd16;
    #5
        Data_in = 8'd32;
    #5
        Data_in = 8'd64;
    #5
        Data_in = 8'd128;
    #5
        Data_in = 8'd31;
    #5
        $stop;

    end

endmodule