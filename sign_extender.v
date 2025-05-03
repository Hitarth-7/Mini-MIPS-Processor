module sign_extender(const, sign_ext);
input [15:0] const;
output [31:0] sign_ext;

assign sign_ext={{16{const[15]}}, const[15:0]};

endmodule