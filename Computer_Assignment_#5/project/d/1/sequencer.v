`timescale 1ps/1ps

module detector_post(input serial_in,get_back,clk,rst,transmitter_signal,output wake_nbit,wake_transmitter);
    reg[3:0] next_state,previous_state; 
    parameter [3:0] A = 0,B = 1,C = 2,D = 3,E = 4,F = 5,G = 6
    ,rise_nbit = 7,rise_transmitter = 9,wait_for_tr_signal = 8,wait_to_get_back = 10;
    always @(previous_state,serial_in,get_back,transmitter_signal) begin
            next_state = A;
        case(previous_state)
            A: next_state = serial_in ? A:B;
            B: next_state = serial_in ? C:B;
            C: next_state = serial_in ? D:B;
            D: next_state = serial_in ? E:B;
            E: next_state = serial_in ? F:B;
            F: next_state = serial_in ? G:B;
            G: next_state = serial_in ? A:rise_nbit;
            rise_nbit: next_state = wait_for_tr_signal;
            wait_for_tr_signal: next_state = transmitter_signal ? rise_transmitter:wait_for_tr_signal;
            rise_transmitter: next_state = wait_to_get_back;
            wait_to_get_back: next_state = get_back ? A:wait_to_get_back;
        endcase
    end
    always @(posedge clk,posedge rst) begin
        if (rst) previous_state <= A;
        else previous_state <= next_state;
    end
    assign wake_nbit = (next_state == rise_nbit) ? 1'b1:1'b0;
    assign wake_transmitter = (previous_state == rise_transmitter) ? 1'b1:1'b0;
endmodule