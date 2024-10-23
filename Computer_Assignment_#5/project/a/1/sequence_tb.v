`timescale 1ns/1ns

module seq_tb ();
    reg sin=1,gb=0,clk=0,rst=0,diff,transmitter_signal = 0;
    wire wake_nbit_post,wake_nbit_pre,wake_transmitter_post,wake_transmitter_pre; 
    detector_pre det_pre(sin,gb,clk,rst,transmitter_signal,wake_nbit_pre,wake_transmitter_pre);
    detector_post det_post(sin,gb,clk,rst,transmitter_signal,wake_nbit_post,wake_transmitter_post);
    assign diff = wake_nbit_pre ^ wake_nbit_post;
    always#10 clk = ~clk;
    initial begin
        #40 sin = 0;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 0;
        #20 gb = 1;
        #20 sin = 0; 
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 0;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1; rst = 1;
        #20 sin = 1; rst = 0;
        #20 sin = 0;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 1;
        #20 sin = 0;
        #20 sin = 1;
        #40 $stop;
    end
endmodule