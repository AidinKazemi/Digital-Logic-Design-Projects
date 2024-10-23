`timescale 1ns/1ns
module assign_oc(input wire aa,bb,cc, output wire y1, y0);
	assign #21 y0 = (aa & ~bb & ~cc) | (~aa & bb & ~cc) 
		| (~aa & ~bb & cc) | (aa & bb & cc);
	assign #15 y1 = (aa & bb) | (aa & cc) | (bb & cc);
endmodule