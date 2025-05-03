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
    d={6'd43,5'd15,5'd23,16'd0}; //ori $15, $15, 5 
#20
    a=9'd5;
    we=1;
    d={6'd35,5'd15,5'd10,16'd0}; //ori $15, $15, 5 
#30
    we=0;
    exec=1;
end
Proc mem(.a(a), .d(d), .exec(exec), .we(we), .clk(clk), .rst(rst));
endmodule