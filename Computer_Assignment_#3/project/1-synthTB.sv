`timescale 1ns/1ns

module one_synth_tb();
    logic [15:0] aa = 0,bb = 0;
    logic cc = 0;
    logic [15:0] owsynth = 0;
    logic [2:0] opco = 0;
    logic zzsynth = 0, nnsynth = 0;
    ALU_behave_synth ccvt(aa,bb,cc,opco,owsynth,zzsynth,nnsynth);
    initial begin
        repeat (4) #200 {aa,bb,cc,opco} = $random; 
        // #10 aa = 16'b1111111111111111; bb = 16'b1111111100001001;
        // #10 opco = 3'd1;
        // #10 opco = 3'd2;
        // #10 opco = 3'd3;
        // #10 opco = 3'd4;
        // #10 opco = 3'd5;
        // #10 opco = 3'd6;
        #200 $stop;
    end
endmodule
