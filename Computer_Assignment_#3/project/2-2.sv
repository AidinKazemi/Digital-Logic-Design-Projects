`timescale 1ns/1ns

module ALU_struct_2(input signed [15:0] inpA,inpB,input logic inpC,
	input logic [2:0] opcode, output logic [15:0] outW,
	output wire zero,negative);
	logic [15:0] the_sum,A_bearer,B_bearer;
    logic one_bearer;
    always @(inpA,inpB,inpC,opcode) begin
        A_bearer = inpA;
        B_bearer = 16'd0;
        one_bearer = 0; 
        case(opcode)
            3'd0: begin A_bearer = ~inpA; one_bearer = 1; end
            3'd1: begin one_bearer = 1;  end
            3'd2: begin one_bearer = inpC; B_bearer = inpB;  end
            3'd3: begin B_bearer = inpB >>> 1;  end
        endcase
	    the_sum = A_bearer + B_bearer + one_bearer;
    end
	always @(inpA,inpB,inpC,opcode) begin
		outW = 16'd0;
		case(opcode)
			3'd0:outW = the_sum;
			3'd1:outW = the_sum;
			3'd2:outW = the_sum;
			3'd3:outW =  the_sum;
			3'd4:outW = inpA & inpB;
			3'd5:outW = inpA | inpB;
			3'd6:outW = {inpA[7:0],inpB[7:0]} ;
		endcase
	end
	assign zero = (outW == 16'd0);
	assign negative = (outW[15] == 1) ;

endmodule
