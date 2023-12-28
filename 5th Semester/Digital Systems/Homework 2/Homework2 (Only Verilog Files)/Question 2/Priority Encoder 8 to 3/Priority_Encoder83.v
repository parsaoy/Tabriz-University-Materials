// Priority Encoder 8->3 with CASEX
module Priority_Encoder83(Data_in, codeOut);

    input [7:0] Data_in;
    output [2:0] codeOut;

    reg [2:0] codeOut;

    always @(*) begin
        casex(Data_in)
            8'b00000001: codeOut = 3'b000;
            8'b0000001x: codeOut = 3'b001;
            8'b000001xx: codeOut = 3'b010;
            8'b00001xxx: codeOut = 3'b011;
            8'b0001xxxx: codeOut = 3'b100;
            8'b001xxxxx: codeOut = 3'b101;
            8'b01xxxxxx: codeOut = 3'b110;
            8'b1xxxxxxx: codeOut = 3'b111;
            default :    codeOut = 3'bxxx;
        endcase
    end
endmodule