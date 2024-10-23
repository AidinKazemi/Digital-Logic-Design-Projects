`timescale 1ns/1ns

module ALU_struct_3(input signed [15:0] inpA,inpB,input logic inpC,
	input logic [2:0] opcode, output logic [15:0] outW,
	output wire zero,negative);
	logic [15:0] the_sum;
    logic [32:0] bearer;
	always @(inpA,inpB,inpC,opcode) begin
		bearer = 33'd0;
		case(opcode)
			3'd0:begin bearer = {1,16'd0,~inpA}; end
			3'd1:begin bearer = {1,16'd0,inpA}; end
			3'd2:begin bearer = {inpC,inpB,inpA}; end
			3'd3:begin bearer = {0,inpB >>> 1,inpA}; end
			3'd4:begin bearer = {0,16'd0,inpA & inpB}; end
			3'd5:begin bearer = {0,16'd0,inpA | inpB}; end
			3'd6:begin bearer = {0,16'd0,{inpA[7:0],inpB[7:0]}}; end
			3'd7:begin bearer = {0,16'd0,16'd0}; end
		endcase
        outW = bearer[32] + bearer[31:16] + bearer[15:0];
	end
	assign zero = (outW == 16'd0);
	assign negative = (outW[15] == 1) ;

endmodule
