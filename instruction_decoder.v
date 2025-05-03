module instruction_decoder(inst, op_code, rs_add, rt_add, rd_add, shamt, func, const, j_add);
input [31:0] inst;
output [5:0] op_code, func;
output [4:0] rs_add, rt_add, rd_add, shamt;
output [15:0] const;
output [25:0] j_add;
assign op_code=inst[31:26];
assign rd_add=inst[25:21];
assign rs_add=inst[20:16];
assign rt_add=inst[15:11];
assign shamt=inst[10:6];
assign func=inst[5:0];
assign const=inst[15:0];
assign j_add=inst[25:0];
endmodule 