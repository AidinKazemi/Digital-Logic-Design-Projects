module pr_edge_dflipflop(input pre,clr,d,clk,output q,qbar);
wire q1,q1bar,q2,q2bar;
s_r_latch s1(pre,clr,q2bar,clk,q1,q1bar),s2(q1bar,clr,clk,d,q2,q2bar)
,s3(pre,clr,q1bar,q2,q,qbar);
endmodule