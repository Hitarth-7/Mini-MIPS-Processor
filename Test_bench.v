`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/29/2025 02:25:59 PM
// Design Name:
// Module Name: test_memory
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

module test_memory();
reg [8:0] a;
reg clk,we, exec, rst;
reg [31:0] d;
wire [31:0] out1, out2, out3, out4;
initial
begin
    clk<=0;
    forever #10 clk<=~clk;
end
initial
begin
        we<=0;
        exec<=0;
        rst<=1;
    #110;
        rst<=0;
//Test Bench for mult and sub instructions 
//a=9'd0;
//we=1;
//d={6'd36,5'd8,5'd0,16'd0};
//#20
//a=9'd1;
//we=1;
//d={6'd13,5'd8,5'd8,16'd4};
//#20
//a=9'd2;
//we=1;
//d={6'd36,5'd9,5'd0,16'd0};
//#20
//a=9'd3;
//we=1;
//d={6'd13,5'd9,5'd9,16'd3};
//#20
//a=9'd4;
//we=1;
//d={6'd0,5'd8,5'd9,16'd24};
//#20
//a=9'd5;
//we=1;
//d={6'd11,5'd9,5'd9,16'h37};
//#20
//a=9'd6;
//we=1;
//d={6'd11,5'd8,5'd9,5'd10,11'h35};
//#20
//a=9'd6;
//we=1;
//d={6'd11,5'd9,5'd8,5'd11,11'h36};
//#20
//Test bench for mult and sub instructions ended
    a=9'd0;
    we=1;
    d={6'd36,5'd23,5'd0,16'd0}; //lui $23, 0x0000
#20
    a=9'd1;
    we=1;
    d={6'd13,5'd23,5'd23,16'd13}; //ori $23, $23, 13
#20
    a=9'd2;
    we=1;
    d={6'd36, 5'd15,5'd0 ,16'd0 }; //lui $15, 0x0000
#20
    a=9'd3;
    we=1;
    d={6'd13,5'd15,5'd15,16'd5}; //ori $15, $15, 5 
#20
    a=9'd4;
    we=1;
    d={6'd43,5'd15,5'd23,16'd0}; //sw $15, 0($23)
#20
    a=9'd5;
    we=1;
    d={6'd36,5'd16,5'd0,16'd0}; //lui $16, 0x0000
#20
    a=9'd6;
    we=1;
    d={6'd13,5'd16,5'd16,16'd3}; //ori $16, $16, 3
#20
    a=9'd7;
    we=1;
    d={6'd43,5'd16,5'd23,16'd1}; //sw $16, 1($23)
#20
    a=9'd8;
    we=1;
    d={6'd36,5'd17,5'd0,16'd0}; //lui $17, 0x0000
#20
    a=9'd9;
    we=1;
    d={6'd13,5'd17,5'd17,16'd9}; //ori $17, $17, 9
#20
    a=9'd10;
    we=1;
    d={6'd43,5'd17,5'd23,16'd2}; //sw $17, 2($23)
#20
    a=9'd11;
    we=1;
    d={6'd36,5'd18,5'd0,16'd0}; //lui $18, 0x0000
#20
    a=9'd12;
    we=1;
    d={6'd13,5'd18,5'd18,16'd7}; //ori $18, $18, 7
#20
    a=9'd13;
    we=1;
    d={6'd43,5'd18,5'd23,16'd3}; //sw $18, 3($23)
#20
    a=9'd14;
    we=1;
    d={6'd36,5'd10,5'd0,16'd0}; //lui $10, 0x0000
#20
    a=9'd15;
    we=1;
    d={6'd13,5'd10,5'd10,16'd13}; //ori $10, $10, 13
#20
    a=9'd16;
    we=1;
    d={6'd36,5'd1,5'd0,16'd0}; //lui $1, 0x0000
#20
    a=9'd17;
    we=1;
    d={6'd13,5'd1,5'd1,16'd4}; //ori $1, $1, 4
#20
    a=9'd18;
    we=1;
    d={6'd36,5'd2,5'd0,16'd0}; //lui $2, 0x0000
#20
    a=9'd19;
    we=1;
    d={6'd13,5'd2,5'd2,16'd1}; //ori $2, $2, 1
#20
    a=9'd20;
    we=1;
    d={6'h33,5'd2,5'd1,16'd21}; //bgte $2, $1, 21
#20
    a=9'd21;
    we=1;
    d={6'd0,5'd2,5'd0,5'd3,5'd0,6'd0}; //sll $3, $2, 0
#20
    a=9'd22;
    we=1;
    d={6'd0,5'd10,5'd3,5'd4,11'd32}; //add $4, $10, $3
#20
    a=9'd23;
    we=1;
    d={6'd35,5'd5,5'd4,16'd0}; //lw $5, 0($4)
#20
    a=9'd24;
    we=1;
    d={6'd8,5'd2,5'd6,16'hffff}; //addi $6, $2, -1
#20
    a=9'd25;
    we=1;
    d={6'h32,5'd6,5'd0,16'd10}; //ble $6, $0, 10
#20
    a=9'd26;
    we=1;
    d={6'd0,5'd6,5'd0,5'd3,5'd0,6'd0}; //sll $3, $6, 0
#20
    a=9'd27;
    we=1;
    d={6'd0,5'd10,5'd3,5'd4,11'd32}; //add $4, $10, $3
#20
    a=9'd28;
    we=1;
    d={6'd35,5'd7,5'd4,16'd0}; //lw $7, 0($4)
#20
    a=9'd29;
    we=1;
    d={6'h34,5'd7,5'd5,16'd6}; //bleq $7, $5, 6
#20
    a=9'd30;
    we=1;
    d={6'd0,5'd6,5'd0,5'd8,5'd0,6'd0}; //sll $8, $6, 0
#20
    a=9'd31;
    we=1;
    d={6'd0,5'd10,5'd8,5'd9,11'd32}; //add $9, $10, $8
#20
    a=9'd32;
    we=1;
    d={6'd8,5'd9,5'd9,16'd1}; //addi $9, $9, 1
#20
    a=9'd33;
    we=1;
    d={6'd43,5'd7,5'd9,16'd0}; //sw $9, 0($7)
#20
    a=9'd34;
    we=1;
    d={6'd8,5'd6,5'd6,16'hffff}; //addi $6, $6, -1
#20
    a=9'd35;
    we=1;
    d={6'd1,26'd25}; //j 25
#20
    a=9'd36;
    we=1;
    d={6'd0,5'd6,5'd0,5'd3,5'd0,6'd0}; //sll $3, $6, 0
#20
    a=9'd37;
    we=1;
    d={6'd0,5'd10,5'd3,5'd4,11'd32}; //add $4, $10, $3
#20
    a=9'd38;
    we=1;
    d={6'd8,5'd4,5'd4,16'd1}; //addi $4, $4, 1
#20
    a=9'd39;
    we=1;
    d={6'd43,5'd5,5'd4,16'd0}; //sw $4, 0($5)
#20
    a=9'd40;
    we=1;
    d={6'd8,5'd2,5'd2,16'd1}; //addi $2, $2, 1
#20
    a=9'd41; 
    we=1;
    d={6'd1,26'd20}; //j 20
#20
    a=9'd42;
    we=1;
    d={6'd35,5'd19,5'd10,16'd0}; //lw $19, 0($10)
#20
    a=9'd43;
    we=1;
    d={6'd35,5'd20,5'd10,16'd1}; //lw $20, 1($10)
#20
    a=9'd44;
    we=1;
    d={6'd35,5'd21,5'd10,16'd2}; //lw $21, 2($10)
#20
    a=9'd45;
    we=1;
    d={6'd35,5'd22,5'd10,16'd3}; //lw $22, 3($10)
#30
    we=0;
    exec=1;
end
Proc mem(.a(a), .d(d), .exec(exec), .we(we), .clk(clk), .rst(rst), .out1(out1), .out2(out2), .out3(out3), .out4(out4));
endmodule