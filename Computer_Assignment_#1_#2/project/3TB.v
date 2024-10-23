`timescale 1ns/1ns
module gate_tb();
	reg ag = 0,bg = 0,cg = 0;
	wire y1g,y0g;
	gate_oc uut1(ag,bg,cg,y1g,y0g);
	initial begin
		#40 ag = 1;
		#40 bg = 1;
		#40 cg = 1;
		#40 ag = 0; bg = 0;
		#100 $stop;
	end
endmodule
