`timescale 1ns/1ns
module fifteen_tb();
	reg [0:14] inputs = 0;
	wire s0,s1,s2,s3;
	fifteen_oc cvt(inputs,s3,s2,s1,s0);
	initial begin
		#120 inputs[0] = 1; inputs[4] = 1;
		#120 inputs[1] = 1;inputs[2] = 1;inputs[3] = 1;
		#120 inputs[14] = 1;inputs[13] = 1;inputs[12] = 1;
		#120 inputs[5] = 1;inputs[6] = 1;inputs[7] = 1;
		#120 inputs[0] = 0;inputs[2] = 0;
		inputs[3] = 0;inputs[4] = 0;
		#160 $stop;
	end

endmodule
