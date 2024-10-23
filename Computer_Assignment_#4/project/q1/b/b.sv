`timescale 1ns/1ns
module s_r_latch(input ss,rr,s,r,output Q,Qbar);
nand#12 n3(Qbar,r,rr,Q);
nand#12 n1(Q,s,ss,Qbar);
endmodule