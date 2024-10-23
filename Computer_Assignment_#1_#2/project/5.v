`timescale 1ns/1ns
module seven_oc(input wire [0:6] wires, output wire s2,s1,s0);
	wire a0,a1,b0,b1,c1;
	complex_oc co1(wires[0],wires[1],wires[2],a1,a0);
	complex_oc co2(wires[3],wires[4],wires[5],b1,b0);
	complex_oc co3(wires[6],a0,b0,c1,s0);
	complex_oc co4(c1,a1,b1,s2,s1);
endmodule
