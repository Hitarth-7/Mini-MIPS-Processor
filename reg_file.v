module reg_file(clk, we, rst, read1, read2, write, data, regout1, regout2);
input clk, we, rst;
input [4:0] read1, read2;
input [4:0] write;
input [31:0] data;
output [31:0] regout1, regout2;

reg [31:0] RF [31:0];

assign regout1=RF[read1];
assign regout2=RF[read2];

always@(posedge rst)
begin
    RF[0]<=32'd0;
    RF[1]<=32'd0;
    RF[2]<=32'd0;
    RF[3]<=32'd0;
    RF[4]<=32'd0;
    RF[5]<=32'd0;
    RF[6]<=32'd0;
    RF[7]<=32'd0;
    RF[8]<=32'd0;
    RF[9]<=32'd0;
    RF[10]<=32'd0;
    RF[11]<=32'd0;
    RF[12]<=32'd0;
    RF[13]<=32'd0;
    RF[14]<=32'd0;
    RF[15]<=32'd0;
    RF[16]<=32'd0;
    RF[17]<=32'd0;
    RF[18]<=32'd0;
    RF[19]<=32'd0;
    RF[20]<=32'd0;
    RF[21]<=32'd0;
    RF[22]<=32'd0;
    RF[23]<=32'd0;
    RF[24]<=32'd0;
    RF[25]<=32'd0;
    RF[26]<=32'd0;
    RF[27]<=32'd0;
    RF[28]<=32'd0;
    RF[29]<=32'd0;
    RF[30]<=32'd0;
    RF[31]<=32'd0;
end

always@(posedge clk)
begin
    if(we)
    begin
        RF[write]<=data;
    end
end


endmodule