module mux2to1 (sel, datain1, datain2, dataout);
parameter W=32;
input sel;
input [W-1:0] datain;
input [W-1:0] datain2;
output reg [W-1:0] dataout;

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