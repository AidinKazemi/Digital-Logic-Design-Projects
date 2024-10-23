`timescale 1ns/1ns

module ALU_struct_1(input signed [15:0] inpA,inpB,input logic inpC,
	input logic [2:0] opcode, output logic [15:0] outW,
	output wire zero,negative);
	logic [15:0] sumAB ,increaA,A_barA,B_shiftB ;
	assign A_barA = {opcode == 3'b000} ? ~inpA : inpA;
	assign B_shiftB = {opcode == 3'b011} ? inpB >>> 1 : inpB;
	assign increaA = A_barA + 1;
	assign sumAB = A_barA + B_shiftB;
	always @(inpA,inpB,inpC,opcode) begin
		outW = 16'd0;
		case(opcode)
			3'd0:outW = increaA;
			3'd1:outW = increaA;
			3'd2:outW = sumAB + inpC;
			3'd3:outW =  sumAB;
			3'd4:outW = inpA & inpB;
			3'd5:outW = inpA | inpB;
			3'd6:outW = {inpA[7:0],inpB[7:0]} ;
		endcase
	end
	assign zero = (outW == 16'd0);
	assign negative = (outW[15] == 1) ;

endmodule