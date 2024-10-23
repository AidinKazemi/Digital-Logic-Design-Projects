`timescale 1ns/1ns
module assign_tb();
	reg a = 0,b = 0,c = 0;
	wire y1a,y0a;
	assign_oc uut2(a,b,c,y1a,y0a);
	wire y0c ,y1c;
	complex_oc uut(a,b,c,y1c,y0c);
	wire y1g,y0g;
	gate_oc uut1(a,b,c,y1g,y0g);
	initial begin
		#40 a = 1;
		#40 b = 1;
		#40 c = 1;
		#40 a = 0;b = 0;
		#100 $stop;
	end
endmodule
