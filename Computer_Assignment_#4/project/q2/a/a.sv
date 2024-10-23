module edge_dflipflop(input d,clk,output q,qbar);
logic one_input = 1;
wire q1,q1bar,q2,q2bar;
s_r_latch s1(one_input,one_input,q2bar,clk,q1,q1bar),s2(q1bar,one_input,clk,d,q2,q2bar)
,s3(one_input,one_input,q1bar,q2,q,qbar);
endmodule