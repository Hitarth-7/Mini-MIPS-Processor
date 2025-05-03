module ALU(op_code, func, regin1, regin2, regout, zero);
input [5:0] op_code, func;
input [31:0] regin1, regin2;
output reg [31:0] regout;
output reg zero;

always@(*)
begin
    if(op_code==6'd0)
    begin
        if(func==6'd32)
        begin
            regout=regin1+regin2;
        end
        else if(func==6'd34)
        begin
            regout=regin1-regin2;
        end
        else if(func==6'd33)
        begin
            regout=$unsigned(regin1)+$unsigned(regin2);
        end
        else if(func==6'd35)
        begin
            regout=$unsigned(regin1)-$unsigned(regin2);
        end
        else if(func==6'd36)
        begin
            regout=regin1&regin2;
        end
        else if(func==6'd37)
        begin
            regout=regin1|regin2;
        end
        else if(func==6'd38)
        begin
            regout=regin1^regin2;
        end
        else if(func==6'd39)
        begin
            regout=~(regin1|regin1);
        end
        else if(func==6'd0)
        begin
            regout=regin1<<regin2;
        end
        else if(func==6'd2 || func==6'd4)
        begin
            regout=regin1>>regin2;
        end
        else if(func==6'd3)
        begin
            regout=regin1>>>regin2;
        end
        else if(func==6'd41)
        begin
            regout=(regin1<regin2?32'd1:32'd0);
        end
        else
        begin
            regout=32'd0;
        end
    end
    else if(op_code==6'd8)
    begin
        regout=regin1+regin2;
    end
    else if(op_code==6'd9)
    begin
        regout=$unsigned(regin1)+$unsigned(regin2);
    end
    else if(op_code==6'd15)
    begin
        regout=regin1&regin2;
    end
    else if(op_code==6'd13)
    begin
        regout=regin1|regin2;
    end
    else if(op_code==6'd14)
    begin
        regout=regin1^regin2;
    end
    else if(op_code==6'd35)
    begin
        regout=regin1+regin2;
    end
    else if(op_code==6'd43)
    begin
        regout=regin1+regin2;
    end
    else if(op_code==6'd36)
    begin
        regout={regin2[15:0], 16'd0};
    end
    else if(op_code==6'd10)
    begin
        regout=(regin1<regin2?32'd1:32'd0);
    end
    else if(op_code==6'd12)
    begin
        regout=(regin1==regin2?32'd1:32'd0);
    end
    else if(op_code==6'd41)
    begin
        zero=(regin1==regin2?1'd1:1'd0);
    end
    else if(op_code==6'd48)
    begin
        zero=(regin1!=regin2?1'd1:1'd0);
    end
    else if(op_code==6'd49)
    begin
        zero=(regin1>regin2?1'd1:1'd0);
    end
    else if(op_code==6'd50)
    begin
        zero=(regin1>=regin2?1'd1:1'd0);
    end
    else if(op_code==6'd51)
    begin
        zero=(regin1<regin2?1'd1:1'd0);
    end
    else if(op_code==6'd52)
    begin
        zero=(regin1<=regin2?1'd1:1'd0);
    end
    else if(op_code==6'd53)
    begin
        zero=($unsigned(regin1)<$unsigned(regin2)?1'd1:1'd0);
    end
    else if(op_code==6'd54)
    begin
        zero=($unsigned(regin1)>$unsigned(regin2)?1'd1:1'd0);
    end
    else
    begin
        regout=32'd0;
        zero=1'd0;
    end
end
endmodule