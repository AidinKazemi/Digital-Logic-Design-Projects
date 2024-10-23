`timescale 1ns/1ns

module bit_tb();
    reg serial_in = 1,clk = 0,rst = 0,rise = 0;
    wire wake_transmitter_pre,wake_transmitter_post;
    wire[7:0] pout_pre,pout_post;
    bit_counter_pre bcp(serial_in,rise,clk,rst,wake_transmitter_pre,pout_pre);
    //bit_counter_post bcpp(serial_in,rise,clk,rst,wake_transmitter_post,pout_post);
    always #30 clk = ~clk; 
    //always #13 serial_in = ~serial_in;
    initial begin
        #20 rst = 1;
        #20 rst = 0;
        #30 rise = 1;
        #30 rise = 0 ;
        #315 serial_in = 0;
        #400 $stop;
    end
endmodule