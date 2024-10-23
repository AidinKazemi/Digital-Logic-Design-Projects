`timescale 1ns/1ns

module circuit_d_tb();
reg clk = 0,rst = 1,si = 1;
wire so,soen,wake;
wire [7:0] num;
circuit_d gg(so,clk,rst,si,soen,wake,num);
always #25 clk = ~clk;
initial begin
    #50 rst = 0;
    #50 si = 0;
    #50 si = 1;
    #50 si = 1;
    #50 si = 1;
    #50 si = 1;
    #50 si = 1;
    #50 si = 0;
    #50 si = 1;
    #50 si = 1;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 1;
    #50 si = 1;
    #50 si = 1;
    #50 si = 1;
    #50 si = 1;
    #50 si = 0;
    #50 si = 1;
    #50 si = 1;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #50 si = 0;
    #400 $stop;
end

endmodule