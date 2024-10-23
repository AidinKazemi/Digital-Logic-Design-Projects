module cosine_hoffman_sm(input start,neg_flag,clk,rst,output init_0,ld_x,ld_y,ld_temp,ld_ans,i_ans,i_temp,x_en,
                    rom_en,cnt_en,y_en,ff_en,ans_en,ans_ready,idff);

    parameter idle = 0,wait_ = 1, init = 2, mult_x1 = 3, mult_x2 = 4, mult_rom1 = 5, mult_rom2 = 6,
                compare_y = 7, add_ans = 8 ;

    reg [3:0] next_state, current_state;
    always @(current_state,start,neg_flag) begin
        case (current_state)
        idle: next_state = start ? wait_ : idle;
        wait_: next_state = start ? wait_ : init;
        init: next_state = mult_x1;
        mult_x1: next_state = mult_x2;
        mult_x2: next_state = mult_rom1;
        mult_rom1: next_state = mult_rom2;
        mult_rom2: next_state = compare_y;
        compare_y: next_state = neg_flag ? idle: add_ans;
        add_ans : next_state = mult_x1;
        default : next_state = idle; 
        endcase
    end
    reg init_0_reg,ld_x_reg,ld_y_reg,ld_temp_reg,ld_ans_reg,i_ans_reg,i_temp_reg,x_en_reg,
            rom_en_reg,cnt_en_reg,y_en_reg,ff_en_reg,ans_en_reg,ans_ready_reg,idff_reg;
    always @(current_state,start,neg_flag) begin
        init_0_reg = 0; ld_x_reg = 0;ld_y_reg = 0;ld_temp_reg = 0;ld_ans_reg = 0;i_ans_reg = 0;
        i_temp_reg = 0;x_en_reg = 0; idff_reg = 0;
        rom_en_reg = 0;cnt_en_reg = 0;y_en_reg = 0;ff_en_reg = 0;ans_en_reg = 0;ans_ready_reg = 0;
        case (current_state)
            idle: begin
                ans_ready_reg = 1;
            end
            init: begin
                init_0_reg = 1;ld_x_reg = 1;ld_y_reg = 1;i_ans_reg = 1;i_temp_reg = 1;
                idff_reg = 1;
            end
            mult_x1: begin
                x_en_reg = 1; ld_temp_reg = 1;
            end
            mult_x2: begin
                x_en_reg = 1; ld_temp_reg = 1;
            end
            mult_rom1: begin
                rom_en_reg = 1; ld_temp_reg = 1; cnt_en_reg = 1;
            end
            mult_rom2: begin
                rom_en_reg = 1; ld_temp_reg = 1; cnt_en_reg = 1;
            end
            compare_y: begin
                y_en_reg = 1; ff_en_reg = 1;
            end
            add_ans: begin
                ans_en_reg = 1; ld_ans_reg = 1;
            end
        endcase
    end
    assign init_0 =  init_0_reg;
    assign ld_x =  ld_x_reg;
    assign ld_y =  ld_y_reg;
    assign ld_temp =  ld_temp_reg;
    assign ld_ans =  ld_ans_reg;
    assign i_ans =  i_ans_reg;
    assign i_temp =  i_temp_reg;
    assign x_en =  x_en_reg;
    assign ans_ready =  ans_ready_reg;
    assign rom_en =  rom_en_reg;
    assign cnt_en =  cnt_en_reg;
    assign y_en =  y_en_reg;
    assign ff_en =  ff_en_reg;
    assign ans_en =  ans_en_reg;
    assign idff = idff_reg;

    always @(posedge clk,posedge rst) begin
        if (rst) current_state <= idle;
        else current_state <= next_state;
        $display ("this is the current state: %d",current_state);
        $display ("this is the neg_flag: %d\n",neg_flag);
    end
    // always @* begin
    // end
endmodule