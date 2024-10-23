`timescale 1ns/1ns

module two_regular_tb();
    logic [15:0] aa = 0,bb = 0;
    logic cc = 0;
    logic [15:0] ow = 0;
    logic [2:0] opco = 0;
    logic zz = 0,nn = 0;
    ALU_struct_2 cvt(aa,bb,cc,opco,ow,zz,nn);
    initial begin
        repeat (4) #30 {aa,bb,cc,opco} = $random; 
        // #10 aa = 16'b1111111111111111; bb = 16'b1111111100001001;
        // #10 opco = 3'd1;
        // #10 opco = 3'd2;
        // #10 opco = 3'd3;
        // #10 opco = 3'd4;
        // #10 opco = 3'd5;
        // #10 opco = 3'd6;
        #40 $stop;
    end
endmodule

