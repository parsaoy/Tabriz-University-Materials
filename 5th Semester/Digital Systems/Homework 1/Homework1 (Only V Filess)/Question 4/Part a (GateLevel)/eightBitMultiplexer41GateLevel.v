// 8-bit 4->1 Multiplexer
module eightBitMultiplexer41GateLevel(I0, I1, I2, I3, s0, s1, D);

    input [7:0] I0;
    input [7:0] I1;
    input [7:0] I2;
    input [7:0] I3;
    input s0, s1;

    output [7:0] D;

    genvar i;

    generate
        for(i = 0; i< 8; i=i+1) begin
            multiplexer41GateLevel u(I0[i], I1[i], I2[i], I3[i], s0, s1, D[i]);
        end
    endgenerate

// Hard Approach
/*     multiplexer41GateLevel u0(I0[0], I1[0], I2[0], I3[0], s0, s1, D[0]);
    multiplexer41GateLevel u1(I0[1], I1[1], I2[1], I3[1], s0, s1, D[1]);
    multiplexer41GateLevel u2(I0[2], I1[2], I2[2], I3[2], s0, s1, D[2]);
    multiplexer41GateLevel u3(I0[3], I1[3], I2[3], I3[3], s0, s1, D[3]);
    multiplexer41GateLevel u4(I0[4], I1[4], I2[4], I3[4], s0, s1, D[4]);
    multiplexer41GateLevel u5(I0[5], I1[5], I2[5], I3[5], s0, s1, D[5]);
    multiplexer41GateLevel u6(I0[6], I1[6], I2[6], I3[6], s0, s1, D[6]);
    multiplexer41GateLevel u7(I0[7], I1[7], I2[7], I3[7], s0, s1, D[7]);
 */
endmodule