`timescale 1ns/1ns

module one_tb();
    logic [15:0] aa = 0,bb = 0;
    logic cc = 0;
    logic [15:0] ow = 0, owsynth = 0;
    logic [2:0] opco = 0;
    logic zz = 0,nn = 0, zzsynth = 0, nnsynth = 0;
    ALU_behave cvt(aa,bb,cc,opco,ow,zz,nn);
    ALU_behave_synth ccvt(aa,bb,cc,opco,owsynth,zzsynth,nnsynth);
    initial begin
        repeat (4) #200 {aa,bb,cc,opco} = $random; 
	#200 bb = 16'b1111111100011111; opco = 3'b011;
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
