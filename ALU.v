module ALU(ALUop, regin1, regin2, regout, aluwe);
input [31:0] regin1, regin2;
input aluwe;
input [5:0] ALUop;
output reg [31:0] regout;
always@(aluwe)
begin
    if(ALUop==6'd0 || ALUop==6'd4)
    begin
        regout=regin1<<regin2;
    end
    else if(ALUop==6'h2)
    begin
        regout=regin1>>regin2;
    end
    else if(ALUop==6'h3)
    begin
        regout=regin1>>>regin2;
    end
    else if(ALUop==6'h20)
    begin
        regout=regin1+regin2;
    end
    else if(ALUop==6'h21)
    begin
        regout=$unsigned(regin1)+$unsigned(regin2);
    end
    else if(ALUop==6'h22)
    begin
        regout=regin1-regin2;
    end
    else if(ALUop==6'h23)
    begin
        regout=$unsigned(regin1)-$unsigned(regin2);
    end
    else if(ALUop==6'h24)
    begin
        regout=regin1&regin2;
    end
    else if(ALUop==6'h25)
    begin
        regout=regin1|regin2;
    end
    else if(ALUop==6'h26)
    begin
        regout=regin1^regin2;
    end
    else if(ALUop==6'h2a)
    begin
        regout=(regin1<regin2?32'd1:32'd0);
    end
    else if(ALUop==6'h2b)
    begin
        regout=(regin1==regin2?32'd1:32'd0);
    end
    else if(ALUop==6'd8)
    begin
        regout=regin1+regin2;
    end
    else if(ALUop==6'd9)
    begin
        regout=$unsigned(regin1)+$unsigned(regin2);
    end
    else if(ALUop==6'd15)
    begin
        regout=regin1&regin2;
    end
    else if(ALUop==6'd13)
    begin
        regout=regin1|regin2;
    end
    else if(ALUop==6'd39)
    begin
        regout=~(regin1|regin2);
    end
    else if(ALUop==6'd14)
    begin
        regout=regin1^regin2;
    end
    else if(ALUop==6'd10)
    begin
        regout=(regin1<regin2?32'd1:32'd0);
    end
    else
    begin
        regout=32'd0;
    end
end
//assign regout=tempout;
endmodule