module memory_wrapper(clk, we, a, d, dpra, dpo);
input [8:0] a, dpra;
input clk, we;
input [31:0] d;
output [31:0] dpo;
dist_mem_gen_0 inst_mem(
    .a(a), 
    .d(d), 
    .dpra(dpra), 
    .clk(clk), 
    .we(we), 
    .dpo(dpo));
endmodule