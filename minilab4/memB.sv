module memB
  #(
    parameter BITS_AB=8,
    parameter DIM=8
    )
   (
    input                      clk,rst_n,en,
    input signed [BITS_AB-1:0] Bin [DIM-1:0],
    output signed [BITS_AB-1:0] Bout [DIM-1:0]
    );

    //logic signed [BITS_AB-1:0] Bouts [DIM-1:0];
    reg signed stall [DIM-1:0];

    genvar row;
    generate
        for(row=0;row<DIM;row++)begin
            fifo data (.clk(clk),.rst_n(rst_n),.en(en),
                        .stall(stall[row]),
                        .d(Bin[row]),
                        .q(Bout[row]));
        end
    endgenerate

    integer row_en;
    integer en_cnt = 0;
    always@(posedge clk,negedge rst_n) begin
        if (!rst_n) begin
            for(row_en=0;row_en<DIM;row_en++)begin
                stall [row_en] <= 1'd0;
            end
        end if(en) begin
            en_cnt++;
            if(en_cnt==8)begin
                for(row_en=1;row_en<DIM;row_en++)begin
                    stall [row_en] <= 1'd1;
                end
            end
            else if(en_cnt > 8)begin
                for(row_en=1;row_en<DIM;row_en++)begin
                    stall[row_en] <= stall[row_en-1];
                end
            end
        end
        
        else if(!en)begin
            en_cnt<=0;
            for(row_en=0;row_en<DIM;row_en++)begin
                stall [row_en] <= 1'd0;
            end
        end
    end

/*
    genvar row_Bouts;
    generate
        for(row_Bouts=0;row_Bouts<DIM;row_Bouts++)begin
            assign Bout[row_Bouts] = delay[row_Bouts]?Bouts[row_Bouts]:0;
        end
    endgenerate
*/

endmodule