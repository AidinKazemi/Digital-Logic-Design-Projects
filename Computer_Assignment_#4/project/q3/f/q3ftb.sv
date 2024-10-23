`timescale 1ns/1ns
module q3f_tb();
logic d = 1, clk = 0;
logic Q = 0,Qbar = 0;
logic pre = 1,clr = 1;
pr_edge_dflipflop edff(pre,clr,d,clk,Q,Qbar);
initial begin
    #80 clk = 1;
    #60 d = 0;
    #20 clk = 0; 
    #80 d = 1;
    #80 d = 0;
    #80 clk = 1;
    #40 clk = 0;
    #40 pre = 0;
    #40 pre = 1;
    #40 clr = 0;
    #80 $stop;
end
endmodule