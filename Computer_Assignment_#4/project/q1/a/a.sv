`timescale 1ns/1ns
module s_r_latch(input ss,rr,s,r,output Q,Qbar);
nand n1(Q,s,ss,Qbar);
nand n3(Qbar,r,rr,Q);
endmodule