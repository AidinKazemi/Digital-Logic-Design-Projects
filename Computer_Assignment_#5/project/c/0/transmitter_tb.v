`timescale 1ns/1ns

module transmitter_tb ();
    reg clk = 0,rst = 0,serial_in = 1,start = 0;
    reg[7:0] parinp = 6;
    wire serial_out_pre,wake_em_up_pre,serial_out_post,wake_em_up_post;
    wire ready_pre,ready_post;
    transmitter_pre tr_pre(clk,rst,serial_in,start,parinp,serial_out_pre,wake_em_up_pre,ready_pre);
    transmitter_post tr_post(clk,rst,serial_in,start,parinp,serial_out_post,wake_em_up_post,ready_post);
    always #25 clk = ~clk;
    always #17 serial_in = ~serial_in;
    initial begin
        #20 rst = 1;
        #20 rst = 0;
        #120 start = 1; rst = 0;
        #50 start = 0;
        #1000 $stop;
    end
endmodule