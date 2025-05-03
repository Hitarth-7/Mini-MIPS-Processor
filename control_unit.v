module control_unit(op_code, func, reg_dst, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
input [5:0] op_code, func;
output [5:0] alu_op;
output reg reg_dst, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write;

assign alu_op=op_code;

always@(*)
begin
    if(op_code!=6'd0 && op_code!=6'd11)
    begin
        if(op_code==6'd41 || (op_code>=6'd48 && op_code<=6'd54))
        begin
            reg_dst<=1'd0;
        end
        else
        begin
            reg_dst<=1'd1;
        end
    end
    else
    begin
        reg_dst<=1'd0;
    end
    if(op_code==6'd41 || (op_code>=6'd48 && op_code<=6'd54))
    begin
        branch<=1'd1;
    end
    else
    begin
        branch<=1'd0;
    end
    if(op_code==6'd35)
    begin
        mem_read<=1'd1;
    end
    else
    begin
        mem_read<=1'd0;
    end
    if(op_code==6'd35)
    begin
        mem_to_reg<=1'd1;
    end
    else
    begin
        mem_to_reg<=1'd0;
    end
    if(op_code==6'd43)
    begin
        mem_write<=1'd1;
    end
    else
    begin
        mem_write<=1'd0;
    end
    if((op_code==6'd0 && func==6'd0) || (op_code==6'd0 && func==6'd2) || (op_code==6'd0 && func==6'd3) || (op_code==6'd0 && func==6'd4) || op_code==6'd12 || op_code==6'd10 || op_code==6'd8 || op_code==6'd9 || op_code==6'd13 || op_code==6'd14 || op_code==6'd15 || op_code==6'd35 || op_code==6'd36 || op_code==6'd43)
    begin
        alu_src<=1'd1;
    end
    else
    begin
        alu_src<=1'd0;
    end
    if(op_code==6'd1 || op_code==6'd3 || op_code==6'd43 || (op_code==6'd41 || (op_code>=6'd48 && op_code<=6'd54)) || (op_code==6'd0 && func==6'd24) || (op_code==6'd0 && func==6'd25) || (op_code==6'd0 && func==6'd26))
    begin
        reg_write<=1'd0;
    end
    else
    begin
        reg_write<=1'd1;
    end
end
endmodule