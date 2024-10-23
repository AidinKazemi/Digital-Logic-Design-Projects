`timescale 1ns/1ns
module gate_oc(input wire aa,bb,cc, output wire y1, y0);
	wire a,b,c;
	nand #6 n1(a,aa,cc),n2(b,bb,aa),n3(c,cc,bb);
	nand #9 nf(y1,a,b,c);
	wire x,y,z,t;
	nand #9 nn1(x,~aa,~bb,cc),nn2(y,aa,~bb,~cc),nn3(z,~aa,~cc,bb)
		,nn4(t,aa,bb,cc);
	nand #12 nnf(y0,x,y,z,t);
endmodule
