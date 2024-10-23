`timescale 1ps/1ps

module bit_counter_post(input serial_in,rise,clk,rst, output wake_transmitter,output[7:0] the_number);
    wire co,n_co,shift_en,wake_signal;
    not not_co(n_co,co);
    or shift_or(shift_en,rise,n_co);
    counter the_cnt(n_co,clk,rst,rise,co,wake_signal);
    shift_reg s_reg(clk,rst,n_co,serial_in,the_number);
    assign wake_transmitter = wake_signal;
endmodule

module counter(input cnt,clk,rst,ld, output co,wake_signal);
    reg [3:0]contain = 8,ns;
    always @(contain,ld,cnt) begin
            if (ld == 1) ns = 0;
            else begin
                if (cnt) begin
                    if (contain == 8) ns = 0;
                    else ns = contain + 1;
                end
                else ns = contain;
            end
    end
    always @(posedge clk,posedge rst) begin
        if (rst) contain <= 8;
        else contain <= ns;
        $display("Current contain value %d", contain);
        $display("Current rise value %d", ld);
        $display("Current ns value %d", ns);
    end
    assign co = (contain == 8) ? 1'b1:1'b0; 
    assign wake_signal = (contain == 7) ? 1'b1:1'b0;
endmodule

module shift_reg(input clk,rst,en,serial_in,output [7:0] pout);
    reg[7:0] contain;
    always @(posedge clk,posedge rst) begin
        if (rst) contain = 8'd0;
        else if(en) contain <= {serial_in,contain[7:1]};
    end
    assign pout = contain;
endmodule