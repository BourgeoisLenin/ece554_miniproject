
// always write A rows from 0 to DIM-1 nonstop until done.
module memA
  #(
    parameter BITS_AB=8,
    parameter DIM=8
    )
   (
    input                      clk,rst_n,en,WrEn,
    input signed [BITS_AB-1:0] Ain [DIM-1:0],
    input [$clog2(DIM)-1:0] Arow,
    output signed [BITS_AB-1:0] Aout [DIM-1:0]
   );

    logic signed WrEn_sel[DIM-1:0];
    reg signed stall [DIM-1:0];

    genvar row;
    generate
      for(row=0;row<DIM;row++)begin
        fifo_transpose fifo_t(.clk(clk),.rst_n(rst_n),.en(en),
                        .stall(1'd0/*stall[row]*/),
                        .WrEn(WrEn_sel[row]),
                        .d(Ain),
                        .q(Aout[row]));
      end
    endgenerate

/*
    integer row_sel;
    integer en_cnt = 0;
    always@(posedge clk,negedge rst_n) begin
      if (!rst_n) begin
            for(row_sel=0;row_sel<DIM;row_sel++)begin
                stall[row_sel] <= 1'd0;
            end
        end if(WrEn) begin
            en_cnt++;
            if(en_cnt==8)begin
                for(row_sel=1;row_sel<DIM;row_sel++)begin
                    stall [row_sel] <= 1'd1;
                end
            end
            else if(en_cnt > 8)begin
                for(row_sel=1;row_sel<DIM;row_sel++)begin
                    stall[row_sel] <= stall[row_sel-1];
                end
            end
        end
        
        else if(!en)begin
            en_cnt<=0;
            for(row_sel=0;row_sel<DIM;row_sel++)begin
                stall [row_sel] <= 1'd0;
            end
        end

    end
*/
    integer i;
    always_comb begin
      for(i=0;i<DIM;i++)begin
        if(WrEn==1'd1 && i == Arow)begin
          WrEn_sel[i] <= WrEn;
        end else
          WrEn_sel[i] <= 1'd0;
      end
    end

    
   endmodule