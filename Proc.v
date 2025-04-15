`timescale 1ns / 1ps
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
input [8:0] a;
input [31:0] d;
reg [31:0] RF [31:0];
reg [31:0] FPR [31:0];
reg [31:0] fin1, fin2;
wire [31:0] fout;
reg [31:0] fprout;
reg fwe;
reg [31:0] PC;
wire [31:0] instruction;
reg [31:0] rs, rt, rd;
reg aluwe;
reg [31:0] PC_curr;
reg [5:0] op_code, func;
reg [4:0] rs_add, rt_add, rd_add, shamt;
reg [4:0] wrt_bck;
reg [15:0] const;
reg [25:0] j_add;
reg [31:0] hi, lo;
reg [63:0] mulout;
reg [8:0] load_add, store_add;
reg [31:0] store_data;
wire [31:0] load_data;
reg load_we;
reg [5:0] ALUop;
reg aluwe;
reg [31:0] regin1, regin2;
wire [31:0] regout;
integer i;
always@(posedge rst)
begin
    lo <= 32'd0;
    hi <=32'd0;
    for(i=0; i<32; i=i+1)
    begin
        RF[i]=32'd0;
        FPR[i]=32'd0;
    end
    PC=32'd0;
    aluwe=1'd0;
    fwe=1'd0;
    PC_curr=32'd0;
end
memory_wrapper inst_mem(.a(a), .d(d), .dpra(PC[8:0]), .clk(clk), .we(we), .dpo(instruction));
always@(posedge clk)
begin
//PC=PC+1;
    if(exec)
    begin
        op_code=instruction[31:26];
        rs_add=instruction[25:21];
        rt_add=instruction[20:16];
        rd_add=instruction[15:11];
        shamt=instruction[10:6];
        func=instruction[5:0];
        const=instruction[15:0];
        j_add=instruction[25:0];
        aluwe=1'd0;
        if(op_code==6'd0)
        begin
            if(func==6'h0 || func==6'h2 || func ==6'h3 || func==6'h4)
            begin
                ALUop<=func;
                regin1<=RF[rs_add];
                regin2<=shamt;
                aluwe<=1'd1;
                // RF[rd_add]=regout;
                wrt_bck<=rd_add;
            end
            else if(func==6'd24)
            begin
                mulout=RF[rs_add]*RF[rt_add];
            end
            else if(func==6'd25)
            begin
                mulout=(RF[rs_add]*RF[rt_add])+{hi, lo};
            end
            else if(func==6'd26)
            begin
                mulout=$unsigned(RF[rs_add]*RF[rt_add])+$unsigned({hi, lo});
            end
            else
            begin
                ALUop<=func;
                regin1<=RF[rs_add];
                regin2<=RF[rt_add];
                aluwe<=1'd1;
                // RF[rd_add]=regout;
                wrt_bck<=rd_add;
            end
            PC_curr<=PC+1;
        end
        else if(op_code==6'd11)
        begin
            if(func==6'h29)
            begin
                fprout<=(FPR[rs_add]==FPR[rt_add]?32'd1:32'd0);
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h30)
            begin
                fprout<=($signed(FPR[rs_add])<=$signed(FPR[rt_add])?32'd1:32'd0);
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h31)
            begin
                fprout<=($signed(FPR[rs_add])<$signed(FPR[rt_add])?32'd1:32'd0);
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h32)
            begin
                fprout<=($signed(FPR[rs_add])>=$signed(FPR[rt_add])?32'd1:32'd0);
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h33)
            begin
                fprout<=($signed(FPR[rs_add])>$signed(FPR[rt_add])?32'd1:32'd0);
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h34)
            begin
                fprout<=FPR[rt_add];
                wrt_bck<=rs_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h35)
            begin
                fin1<=FPR[rs_add];
                fin2<=FPR[rt_add];
                fwe<=1'd1;
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h36)
            begin
                fin1<=FPR[rs_add];
                fin2<=FPR[rt_add]^32'h8000_0000;
                fwe<=1'd1;
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h37)
            begin
                fprout = RF[rt_add];
                wrt_bck = rs_add;
                PC_curr<=PC+1;
            end
            else if(func==6'h38)
            begin
                fprout = FPR[rs_add];
                wrt_bck = rt_add;
                PC_curr<=PC+1;
            end
            else
            begin
                fin1<=FPR[rs_add];
                fin2<=FPR[rt_add];
                fwe<=1'd1;
                wrt_bck<=rd_add;
                PC_curr<=PC+1;
            end
        end
        else
        begin
            if(op_code==6'h29)
            begin
                PC_curr<=(RF[rs_add]==RF[rt_add]?PC+1+const:PC+1);
            end
            else if(op_code==6'h30)
            begin
                PC_curr<=(RF[rs_add]==RF[rt_add]?PC+1:PC+const+1);
            end
            else if(op_code==6'h31)
            begin
                PC_curr<=($signed(RF[rs_add])>$signed(RF[rt_add])?PC+const+1:PC+1);
            end
            else if(op_code==6'h32)
            begin
                PC_curr<=($signed(RF[rs_add])<$signed(RF[rt_add])?PC+const+1:PC+1);
            end
            else if(op_code==6'h33)
            begin
                PC_curr<=($signed(RF[rs_add])>=$signed(RF[rt_add])?PC+const+1:PC+1);
            end
            else if(op_code==6'h34)
            begin
                PC_curr<=($signed(RF[rs_add])<=$signed(RF[rt_add])?PC+const+1:PC+1);
            end
            else if(op_code==6'h35)
            begin
                PC_curr<=($unsigned(RF[rs_add]<$unsigned(RF[rt_add]))?PC+const+1:PC+1);
            end
            else if(op_code==6'h36)
            begin
                PC_curr<=($unsigned(RF[rs_add]>$unsigned(RF[rt_add]))?PC+const+1:PC+1);
            end
            else if(op_code==6'd1)
            begin
                PC_curr<=j_add;
            end
            else if(op_code==6'd2)
            begin
                RF[31]=PC+1;
                PC_curr=j_add;
            end
            else if(op_code==6'd3)
            begin
                PC_curr=RF[rs_add];
            end
            else if(op_code==6'd35)
            begin
                load_we=1'd0;
                load_add=RF[rt_add]+const;
                // RF[rt_add]=load_data;
                wrt_bck=rs_add;
                PC_curr=PC+1;
            end
            else if(op_code==6'd43)
            begin
                load_we=1'd1;
                store_add=RF[rt_add]+const;
                store_data=RF[rs_add];
                //    load_we=1'd0;
                PC_curr=PC+1;
            end
            else if(op_code==6'd36)
            begin
                RF[rs_add][31:16]<=const;
                PC_curr<=PC+1;
            end
            else
            begin
                ALUop<=op_code;
                regin1<=RF[rs_add];
                if(op_code==6'd8 || op_code ==6'd9)
                begin
                    regin2<={{16{const[15]}}, const};
                end
                else
                begin
                    regin2<=const;
                end
                aluwe<=1'd1;
                // RF[rt_add]=regout;
                wrt_bck<=rt_add;
                PC_curr<=PC+1;
            end
        end
    end
end
ALU alu1(ALUop, regin1, regin2, regout, aluwe);
memory_wrapper data_mem(.a(store_add), .d(store_data), .dpra(load_add), .clk(clk), .we(load_we), .dpo(load_data));
fp_add myfpad(.inp1(fin1), .inp2(fin2), .out(fout), .fwe(fwe));
always@(negedge clk)
begin
    PC=PC_curr;
    if(op_code==6'd35)
    begin
        RF[wrt_bck]=load_data;
        //load_we=1'd0;
    end
    else if(func==6'd24 || func==6'd25 || func==6'd26)
    begin
        {hi, lo}=mulout;
    end
    else if(op_code==6'd11)
    begin
        if(func==6'h35 || func==6'h36)
        begin
            FPR[wrt_bck]=fout;
        end
        else if (func ==6'h38)
        begin
            RF[wrt_bck] = fprout;
        end
        else
        begin
            FPR[wrt_bck]=fprout;
        end
    end
    else
    begin
        if(op_code!=6'd1 && op_code!=6'd35 && op_code!=6'd36 && op_code!=6'd43 && op_code!=6'h29 && op_code!=6'h30 && op_code!=6'h31 && op_code!=6'h32 && op_code!=6'h33 && op_code!=6'h34 && op_code!=6'h35 && op_code!=6'h36)
        begin
            RF[wrt_bck]=regout;
        end
        //aluwe=1'd0;
    end
end
endmodule