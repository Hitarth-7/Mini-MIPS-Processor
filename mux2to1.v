module mux2to1 (sel, datain1, datain2, dataout);
input sel;
input [31:0] datain1;
input [31:0] datain2;
output reg [31:0] dataout;

always@(*)
begin
   if(sel==1'd0)
   begin
        dataout<=datain1;
   end
   else
   begin
        dataout<=datain2;
   end
end
endmodule