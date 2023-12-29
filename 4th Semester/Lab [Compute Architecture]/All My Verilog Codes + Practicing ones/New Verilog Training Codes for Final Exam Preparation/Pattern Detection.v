module patterDetection(input X,clk,rst output detected);

// patten to detect = 1100

/* reg [2:0] level;

assign detected = (level == 3'd4)? 1'b1:1'b0;

always @(posedge X)
begin
    if(rst)
        begin
            detected = 0;
            level = 0;
        end
    else
        case(level)
        0:begin if(X) level = 1; else level = 0; end
        1:begin if(X) level = 2; else level = 0; end
        2:begin if(X) level = 2; else level = 3; end
        3:begin if(X) level = 1; else level = 4; end
        4:begin if(X) level = 1; else level = 0; end
        endcase

end */


/* reg [3:0]current_level;
assign detected = (current_level == 4)? 1'b1:1'b0;

always @(posedge)
begin
    if(rst)
        current_level = 0;
        detected = 0;
    else
    begin
        case(current_level)
        0:  begin if(X) current_level=1'd1; else current_level= 1'd0;
        1:  begin if(X) current_level=1'd2; else current_level= 1'd0;
        2:  begin if(X) current_level=1'd2; else current_level= 1'd3;
        3:  begin if(X) current_level=1'd1; else current_level= 1'd4;
        4:  begin if(X) current_level=1'd1; else current_level= 1'd0;
        endcase


    end;
end */

reg [3:0]Zarf;
reg led;
reg [1:0]i;

always @(posedge clk)
begin
    if(rst)
        begin
            led = 1'b0;
            Zarf = 4'b0;
            detected = 1'b0;
            i = 1'b0;
        end

    else
        begin
/*             if(i<4)
            begin
                i = i+1;
            end
            else if(i==4)
                led = 1; */
            i = i+1;
            
            if(i>3)
                led = 1;

            Zarf = Zarf<<1;
            Zarf[0] = X;
        end
end

assign y = (Zarf == 4'b1100 && led == 1)? 1'b1: 1'b0;

endmodule