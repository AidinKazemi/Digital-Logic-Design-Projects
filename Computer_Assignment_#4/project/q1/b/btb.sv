`timescale 1ns/1ns
module s_r_latch_tb();
logic s  = 1, r = 1, ss = 1, rr = 1;
logic Q = 0,Qbar = 0;
s_r_latch sr(ss,rr,s,r,Q,Qbar);
initial begin
    #40 s = 0; 
    #40 s = 1; r = 0; 
    #40 r = 1; 
    #40 r = 0;s = 0; 
    #40 $stop;
end
endmodule