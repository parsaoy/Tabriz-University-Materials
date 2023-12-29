module Decoder (input [1:0]X, input en, output [3:0] Y);

	assign Y = (~en)? 4'b0000 : (X==0) ? 4'h0 : (X==2'b01) ? 4'b0001 : (X==2'd2) ? 4'd2 : (X==3)? 4'b1111: 0;

endmodule