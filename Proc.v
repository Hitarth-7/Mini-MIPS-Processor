timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/14/2025 09:38:35 PM
// Design Name:
// Module Name: Proc
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module Proc(clk, rst, exec, we, d, a);
input clk, rst, exec;
input we;
input [31:0] d;
input [8:0] a;

reg [8:0] PC;
wire [31:0] instruction;
wire [5:0] op_code, func;
wire [4:0] rs_add, rt_add, rd_add, shamt;
wire [15:0] const;
wire [25:0] j_add;
wire reg_dst, branch, mem_read, mem_to_reg, mem_write, alu_src, reg_write;
wire [5:0] ALUop;
wire [31:0] se_const;
wire [4:0] reg_wrt_bck;
wire [31:0] rs, rt;
wire [31:0] alu_reg, alu_out;
wire zero;
wire [31:0] mem_out;
reg [31:0] hi, lo;
reg [63:0] mulout;
wire [31:0] reg_wrt_data;
wire [31:0] wrt_data_fin;
wire jalyes;
wire [4:0] wrt_add_fin;
wire mul_dec;
wire branch_decider;

memory_wrapper inst_mem(.a(a), .d(d), .dpra(PC), .clk(clk), .dpo(instruction), .we(we));
instruction_decoder inst_dec(.inst(instruction), .op_code(op_code), .rs_add(rs_add), .rt_add(rt_add), .rd_add(rd_add), .shamt(shamt), .func(func), .const(const), .j_add(j_add));
control_unit myctr(.op_code(op_code), .func(func), .reg_dst(reg_dst), .branch(branch), .mem_read(mem_read), .mem_to_reg(mem_to_reg), .alu_op(ALUop), .mem_write(mem_write), .alu_src(alu_src), .reg_write(reg_write));
sign_extender my_ext(.const(const), .sign_ext(se_const));
mux2to1 regdesty(.sel(reg_dst), .datain1(rd_add), .datain2(rt_add), .dataout(reg_wrt_bck));
mux2to1 jaladd(.sel(jalyes), .datain1({27'd0, reg_wrt_bck}), .datain2(32'd31), .dataout(wrt_add_fin));
mux2to1 jaldata(.sel(jalyes), .datain1(reg_wrt_data), .datain2({23'd0, PC+1}), .dataout(wrt_data_fin));
reg_file myregfile(.clk(clk), .we(reg_write), .rst(rst), .read1(rs_add), .read2(rt_add), .write(wrt_add_fin[4:0]), .data(wrt_data_fin), .regout1(rs), .regout2(rt));
mux2to1 alusource(.sel(alu_src), .datain1(rt), .datain2(se_const), .dataout(alu_reg));
ALU myalu(.op_code(op_code), .func(func), .regin1(rs), .regin2(alu_reg), .regout(alu_out), .zero(zero));
memory_wrapper data_mem(.a(alu_out[8:0]), .d(rt), .dpra(alu_out[8:0]), .dpo(mem_out), .clk(clk), .we(mem_write));
mux2to1 memreg(.sel(mem_to_reg), .datain1(alu_out), .datain2(mem_out), .dataout(reg_wrt_data));
and(branch_decider, branch, zero);
assign jalyes=op_code==6'd2;
assign mul_dec=(op_code==6'd0 && (func==6'd24 || func==6'd25 || func==6'd26));
always@(*)
begin
    if(op_code==6'd0 && func==6'd24)
    begin
        mulout=rs*rt;
    end
    else if(op_code==6'd0 && func==6'd25)
    begin
        mulout=(rs*rt) + {hi, lo};
    end
    else if(op_code==6'd0 && func==6'd26)
    begin
        mulout=$unsigned(rs*rt) + $unsigned({hi, lo});
    end
end

always@(posedge rst)
begin
    hi<=32'd0;
    lo<=32'd0;
    PC<=9'd0;
end

always@(posedge clk)
begin
    if(exec)
    begin
        if(op_code==6'd0 && (func==6'd24 || func==6'd25 || func==6'd26))
        begin
            {hi, lo}<=mulout;
        end
        else 
        begin
            {hi, lo}<={hi, lo};
        end
        if(op_code==6'd1)
        begin
            PC<=j_add;
        end
        else if(op_code==6'd2)
        begin
           PC<=j_add;
        end
        else if(op_code==6'd3)
        begin
            PC<=rs;
        end
        else if(op_code==6'd41 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else if(op_code==6'd48 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else if(op_code==6'd49 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else if(op_code==6'd50 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else if(op_code==6'd51 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else if(op_code==6'd52 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else if(op_code==6'd53 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else if(op_code==6'd54 && branch_decider)
        begin
            PC<=PC+se_const+1;
        end
        else 
        begin
            PC<=PC+1;
        end
    end
end

endmodule