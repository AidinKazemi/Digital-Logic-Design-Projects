`timescale 1ns/1ns
module q2b_tb();
logic d = 1, clk = 0;
logic Q = 0,Qbar = 0;
edge_dflipflop edff(d,clk,Q,Qbar);
initial begin
    #80 clk = 1;
    #60 d = 0;
    #20 clk = 0; 
    #80 d = 1;
    #80 d = 0;
    #80 clk = 1;
    #80 $stop;
end
endmodule