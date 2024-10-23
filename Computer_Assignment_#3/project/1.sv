`timescale 1ns/1ns

module ALU_behave(input signed [15:0] inpA,inpB,input logic inpC,
	input logic [2:0] opcode, output logic [15:0] outW,
	output wire zero,negative);
	always @(inpA,inpB,inpC,opcode) begin
		outW = 16'd0;
		case(opcode)
			3'b000:outW = ~inpA + 1;
			3'b001:outW = inpA + 1;
			3'b010:outW = inpA + inpB + inpC;
			3'b011:outW = inpA + inpB >>> 1;
			3'b100:outW = inpA & inpB;
			3'b101:outW = inpA | inpB;
			3'b110:outW = {inpA[7:0],inpB[7:0]} ;
		endcase
	end
	assign zero = (outW == 16'd0);
	assign negative = (outW[15] == 1) ;

endmodule
