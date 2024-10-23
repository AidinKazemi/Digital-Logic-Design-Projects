`timescale 1ns/1ns
module seven_tb();
	reg [0:6] inputs = 0;
	wire s0,s1,s2;
	seven_oc uuts(inputs,s2,s1,s0);
	initial begin
		#100 inputs[0] = 1;
		#100 inputs[1] = 1;inputs[2] = 1;
		#100 inputs[5] = 1;inputs[6] = 1;
		#100 inputs[0] = 0;inputs[1] = 0;
		#160 $stop;
	end
endmodule
