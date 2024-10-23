`timescale 1ns/1ns

module cosine_tb ();
    reg clk = 0,rst = 0,start = 0;
    reg[15:0] the_x = 16'b0000001010111101;
    reg[7:0] the_y = 8'b00000001;
    // reg[15:0] the_x = 16'b0000001100100100;
    // reg [7:0] the_y = 8'b00000001;
    wire [15:0] ans,anp;
    wire ans_ready,anrp;
    cosine_asserter cosiner(clk,rst,start,the_x,the_y,ans,ans_ready);
    cosines q_cosines(clk,rst,start,the_x,the_y,anp,anrp);
    always #25 clk = ~clk;
    initial begin
        #17 rst = 1;
        #30 rst = 0;
        #32 start = 1;
        #54 start = 0;
        #3000 the_x = 16'b0000000000000000; the_y = 8'b00000001;
        #35 start = 1;
        #33 start = 0;
        #3000 $stop;
    end
endmodule