module cosines(input clk,rst,start,input[15:0] the_x,input[7:0] the_y
                        ,output[15:0] ans,output ans_ready);
wire neg_flag,init_0,ld_x,ld_y,ld_ans,ld_temp,i_ans,i_temp,
    x_en,rom_en,cnt_en,y_en,ff_en,ans_en,idff;
    cosine_hoffman_sm sm(start,neg_flag,clk,rst,init_0,ld_x,ld_y,ld_temp,ld_ans,i_ans,i_temp,x_en,
                    rom_en,cnt_en,y_en,ff_en,ans_en,ans_ready,idff);
    cosine_dp dp(neg_flag,clk,rst,init_0,ld_x,ld_y,ld_temp,ld_ans,i_ans,i_temp,x_en,
                    rom_en,cnt_en,y_en,ff_en,ans_en,ans_ready,idff
                    ,ans,the_x,the_y);
endmodule