module cosine_dp (output neg_flag,input clk,rst,init_0,ld_x,ld_y,ld_temp,ld_ans,i_ans,i_temp,x_en,
                    rom_en,cnt_en,y_en,ff_en,ans_en,ans_ready,idff,output [15:0] ans,
                    input [15:0] data_x,input [7:0]data_y);
    wire[15:0] sum_result,x_out,y_out,temp_out,ans_out;
    wire[15:0] mult_result;
    wire[15:0] mult_in;
    wire cout,make_neg;
    wire cin;
    wire [15:0] add_a,add_b;
    wire[7:0] rom_out;
    wire dff_in,q_ff;
    wire co;
    wire [3:0] count_out;

    register x_reg(clk,rst,data_x,16'd0,ld_x,1'd0,x_out),y_reg(clk,rst,{8'd0,data_y},16'd0,ld_y,1'd0,y_out),
                    ans_reg(clk,rst,sum_result,16'd256,ld_ans,i_ans,ans_out),
                    temp_reg(clk,rst,mult_result[15:0],16'd256,ld_temp,i_temp,temp_out) ;

    assign mult_in = rom_en ? {8'd0,rom_out} : x_en ? x_out : 16'd0;
    mult_unit multiplier(temp_out,mult_in,mult_result);
    
    assign make_neg = ans_en & q_ff;
    assign cin = y_en | make_neg;
    assign add_a = ans_en ? ans_out : y_en ? ~y_out : 16'd0;
    assign add_b = make_neg ? ~temp_out: temp_out;
    add_unit adder(cin,add_a,add_b,sum_result,cout);

    assign dff_in = q_ff ^ ff_en;
    ddff the_dff(clk,rst,dff_in,idff,q_ff);

    hex_rom rom(count_out,rom_out);
    
    counter the_counter(clk,rst,cnt_en,init_0,count_out,co);

    assign neg_flag = sum_result[15];
    always @(posedge clk, posedge rst) begin
        $display ("this is neg flag in dp: %d", neg_flag);
        $display ("this is ans_out in dp: %b", ans_out);
        $display ("this is make_neg in dp: %b", make_neg);
        $display ("this is ans_en and q_ff in dp: %b %b %b", ans_en, ff_en, idff);

    end
    assign ans = ans_out;
endmodule

module register (input clk,rst,input [15:0] data_in,init_val,input ld_en,init,
                output [15:0] data_out);
    reg [15:0] data_out_reg;
    always @(posedge clk,posedge rst) begin
        if (rst) data_out_reg <= 0;
        else begin
            if (init) data_out_reg <= init_val;
            else data_out_reg <= ld_en ? data_in:data_out_reg;
        end
    end
    assign data_out = data_out_reg;
endmodule

module add_unit (input cin,input [15:0]inp_a,inp_b,output [15:0] full_out,output cout);
    assign {cout,full_out} = inp_a + inp_b + cin;
endmodule

module mult_unit (input [15:0]inp_a,inp_b,output [15:0] full_out);
    reg [15:0] out_reg;
    always @* begin
        out_reg = ((inp_a[15:8] * inp_b[15:8]) << 8)
         + inp_a[7:0] * inp_b[15:8] + inp_a[15:8] * inp_b[7:0]
         + ((inp_a[7:0] * inp_b[7:0]) >> 8);
    end
    assign full_out = out_reg;
endmodule

module hex_rom(input [3:0] addr,output[7:0] val_out);
    reg[7:0] val_out_reg;
    always @(addr) begin
        case (addr)
            0: val_out_reg = 8'b11111111;
            1: val_out_reg = 8'b10000000;
            2: val_out_reg = 8'b01010101;
            3: val_out_reg = 8'b01000000;
            4: val_out_reg = 8'b00110011;
            5: val_out_reg = 8'b00101010;
            6: val_out_reg = 8'b00100100;
            7: val_out_reg = 8'b00100000;
            8: val_out_reg = 8'b00011100;
            9: val_out_reg = 8'b00011001;
            10: val_out_reg = 8'b00010111;
            11: val_out_reg = 8'b00010101;
            default: val_out_reg = 8'b11111111;
        endcase
    end
    assign val_out = val_out_reg;
endmodule

module ddff (input clk,rst,data_in,idff,output data_out);
    reg data_out_reg;
    always @(posedge clk,posedge rst) begin
        if (rst) data_out_reg <= 0;
        else begin
            if (idff) data_out_reg <= 0;
            else begin data_out_reg <= data_in; end
        end
    end
    assign data_out = data_out_reg;
endmodule

module counter (input clk,rst,cnt,init_0, output[3:0] data_out,output co);
    reg[3:0] data_out_reg;
    always @(posedge clk,posedge rst) begin
        if (rst) data_out_reg <= 0;
        else begin
            if (init_0) data_out_reg <= 0;
            else if(cnt) data_out_reg <= data_out + 1 ;
        end
    end
    assign co = cnt ? &{data_out_reg} : 1'd0;
    assign data_out = data_out_reg;
endmodule