`timescale 1ps/1ps

module transmitter_post (input clk,rst,serial_in,start, input[7:0] parint
                        ,output serial_out,wake_em_up,serout_ready,output[7:0] container);
    reg serout_en_reg ;
    wire not_co,co,serout_en;
	 wire [7:0] contain;
    not noooot(not_co,co);
    or ooorrrr(serout_en,not_co,start);
    down_counter dcntr(clk,rst,not_co,start,parint,co,wake_em_up,contain);
    assign serial_out = serial_in;
    always @(posedge clk) begin
        serout_en_reg <= serout_en;
    end
    assign serout_ready = serout_en_reg;
	 assign container = parint;
endmodule

module down_counter (input clk,rst,count_en,load_en,input[7:0] load_inp
                    ,output co,wake_em_up,output [7:0] container);
    reg[7:0] contain = 0,ns;
    always @(count_en,load_en,load_inp,contain) begin
            if (load_en) ns = load_inp - 1;
            else if (count_en) ns = contain - 1;
            else ns = contain;
    end
    always @(posedge clk,posedge rst) begin
        if (rst) contain <= 8'd0;
        else contain <= ns;
        $display("Current load value %b", load_inp);
        $display("Current contain value %b", contain);
        $display("Current wake value %b", wake_em_up);
        $display("Current co value %b", co);
        $display("Current load_en value %b \n", load_en);
    end
        assign co = (contain == 0) ? 1'b1: 1'b0;
        assign wake_em_up = (contain == 8'd1) ? 1'b1:1'b0;
		  assign container = contain;
endmodule