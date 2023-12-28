// Normal Encoder 8->3
// First Part Q2
module Normal_Encoder83(Data_in, codeOut);

    input [7:0] Data_in;
    output [2:0] codeOut;

    reg [2:0] codeOut;

    always @(*) begin
        case(Data_in)
            8'd1:    codeOut = 3'b000;
            8'd2:    codeOut = 3'b001;
            8'd4:    codeOut = 3'b010;
            8'd8:    codeOut = 3'b011;
            8'd16:   codeOut = 3'b100;
            8'd32:   codeOut = 3'b101;
            8'd64:   codeOut = 3'b110;
            8'd128:  codeOut = 3'b111;
            default: codeOut = 3'bxxx;
        endcase
    end
endmodule