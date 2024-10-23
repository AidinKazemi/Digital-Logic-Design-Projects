`timescale 1ns/1ns
module q3h_tb();
logic d = 1, clk = 0;
logic Q = 0,Qbar = 0;
logic pre = 0,clr = 1;
pr_edge_dflipflop edff(pre,clr,d,clk,Q,Qbar);
initial begin
    #80 clk = 1;
    #80 d = 0; clk = 0; 
    #80 $stop;
end
endmodule