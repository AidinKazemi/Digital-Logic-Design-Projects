`timescale 1ns/1ns
module complex_tb();
	reg a = 0,b = 0,c = 0;
	wire yy0 ,yy1;
	complex_oc uut(a,b,c,yy1,yy0);
	initial begin
		#40 a = 1;
		#40 b = 1;
		#40 c = 1;
		#40 a = 0; b = 0;
		#100 $stop;
	end
endmodule
