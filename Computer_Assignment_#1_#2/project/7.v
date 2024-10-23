`timescale 1ns/1ns
module fifteen_oc(input wire [0:14]inputs,output s3,s2,s1,s0);
	wire x0,x1,x2;
	seven_oc oca(inputs[0:6],x2,x1,x0);
	wire y0,y1,y2;
	seven_oc ocb(inputs[7:13],y2,y1,y0);
	wire c1,d1;
	complex_oc oc1(inputs[14],x0,y0,c1,s0);
	complex_oc oc2(c1,x1,y1,d1,s1);
	complex_oc oc3(d1,x2,y2,s3,s2);
endmodule
