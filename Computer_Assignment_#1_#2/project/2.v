`timescale 1ns/1ns
module complex_oc(input wire aa, bb, cc,output wire y1, y0);
	supply1 vdd;
	supply0 gnd;
	wire a,b,c,d,e,f,g,h;
	pmos #(5,6,7) p1(a,vdd,aa),p2(b,a,cc),p3(c,a,bb),p4(y0,b,~bb)
		,p5(y0,c,~cc),p6(e,vdd,~aa),p7(f,e,~cc),p8(g,e,bb),
		p9(y0,f,~bb),p10(y0,g,cc);
	wire a1,b1,c1;
	nmos #(3,4,5) n1(a1,gnd,~aa),n2(b1,gnd,~bb),n3(b1,gnd,~cc),
		n4(a1,b1,bb),n5(a1,b1,cc),n6(y0,a1,aa),n7(c1,a1,cc),
		n8(c1,a1,~bb),n9(y0,c1,bb),n10(y0,c1,~cc);
	wire a2,b2,c2,d2,e2,f2;
	pmos #(5,6,7) pp1(a2,vdd,~cc),pp2(y1,a2,~bb),pp3(b2,vdd,~aa),
		pp4(y1,b2,~cc),pp5(y1,b2,~bb);
	nmos #(3,4,5) nn1(c2,gnd,~bb),nn2(c2,gnd,~cc),nn3(y1,c2,~aa),
		nn4(d2,c2,~cc),nn5(y1,d2,~bb);
endmodule