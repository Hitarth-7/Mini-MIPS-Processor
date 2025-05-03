timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 02:44:39 PM
// Design Name: 
// Module Name: proc_new_tb
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


module proc_new_tb();
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

    d={6'd8,5'd14,5'd14,16'd41}; 

#20

    a=9'd1;

    we=1;

    d={6'd8,5'd0,5'd8,16'd5}; 

#20

    a=9'd2;

    we=1;

    d={6'd43, 5'd14,5'd8 ,16'd0 }; 

#20

    a=9'd3;

    we=1;

    d={6'd8,5'd0,5'd8,16'd9}; 

#20

    a=9'd4;

    we=1;

    d={6'd43,5'd14,5'd8,16'd1}; 

#20

    a=9'd5;

    we=1;

    d={6'd8,5'd0,5'd8,16'd3};

#20

    a=9'd6;

    we=1;

    d={6'd43,5'd14,5'd8,16'd2};

#20

    a=9'd7;

    we=1;

    d={6'd8,5'd0,5'd8,16'd7};

#20

    a=9'd8;

    we=1;

    d={6'd43,5'd14,5'd8,16'd3};

#20

    a=9'd9;

    we=1;

    d={6'd8,5'd0,5'd1,16'd4};

#20

    a=9'd10;

    we=1;

    d={6'd8,5'd0,5'd2,16'd1};

#20

    a=9'd11;        //OUTER LOOP

    we=1;

    d={6'd50,5'd2,5'd1,16'd21};

#20

    a=9'd12;

    we=1;

    d={6'd0,5'd2,5'd0,5'd3,5'd0,6'd0};

#20

    a=9'd13;

    we=1;

    d={6'd0,5'd14,5'd3,5'd4,11'd32};

#20

    a=9'd14;

    we=1;

    d={6'd35,5'd4,5'd5,16'd0};

#20

    a=9'd15;

    we=1;

    d={6'd8,5'd2,5'd6,16'hffff};

#20

    a=9'd16;        //INNER LOOP

    we=1;

    d={6'd51,5'd6,5'd0,16'd10};

#20

    a=9'd17;

    we=1;

    d={6'd0,5'd6,5'd0,5'd3,5'd0,6'd0};

#20

    a=9'd18;

    we=1;

    d={6'd0,5'd14,5'd3,5'd4,11'd32};

#20

    a=9'd19;

    we=1;

    d={6'd35,5'd4,5'd7,16'd0};

#20

    a=9'd20;

    we=1;

    d={6'd52,5'd7,5'd5,16'd6};

#20

    a=9'd21;

    we=1;

    d={6'd0,5'd6,5'd0,5'd8,5'd0,6'd0};

#20

    a=9'd22;

    we=1;

    d={6'd0,5'd14,5'd8,5'd9,11'd32};

#20

    a=9'd23;

    we=1;

    d={6'd8,5'd9,5'd9,16'd1};

#20

    a=9'd24;

    we=1;

    d={6'd43,5'd9,5'd7,16'd0};

#20

    a=9'd25;

    we=1;

    d={6'd8,5'd6,5'd6,16'hffff};

#20

    a=9'd26;

    we=1;

    d={6'd1,26'd16};

#20

    a=9'd27;     //INSERT_KEY

    we=1;

    d={6'd0,5'd6,5'd0,5'd3,5'd0,6'd0};

#20

    a=9'd28;

    we=1;

    d={6'd0,5'd14,5'd3,5'd4,11'd32};

#20

    a=9'd29;

    we=1;

    d={6'd8,5'd4,5'd4,16'd1};

#20

    a=9'd30;

    we=1;

    d={6'd43,5'd4,5'd5,16'd0};

#20

    a=9'd31;

    we=1;

    d={6'd8,5'd2,5'd2,16'd1};

#20

    a=9'd32;

    we=1;

    d={6'd1,26'd11};

#20

    a=9'd33;    //DONE

    we=1;

    d={6'd35,5'd14,5'd19,16'd0};

#20

    a=9'd34;

    we=1;

    d={6'd35,5'd14,5'd20,16'd1};

#20

    a=9'd35;

    we=1;

    d={6'd35,5'd14,5'd21,16'd2};

#20

    a=9'd36;

    we=1;

    d={6'd35,5'd14,5'd22,16'd3};

 

#30

    we=0;

    exec=1;

end
Proc mem(.a(a), .d(d), .exec(exec), .we(we), .clk(clk), .rst(rst));


endmodule