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
    reg signed true_en [DIM-1:0];
    logic signed Aouts [DIM-1:0];

    genvar row;
    generate
      for(row=0;row<DIM;row++)begin
        fifo_transpose fifo_t(.clk(clk),.rst_n(rst_n),.en(en),
                        .WrEn(WrEn_sel[row]),
                        .d(Ain),
                        .q(Aouts[DIM-1:0]));
      end
    endgenerate

    integer row_en;
    always@(posedge clk,negedge rst_n) begin
      if (!rst_n) begin
            for(row_en=0;row_en<DIM;row_en++)begin
                true_en[row_en] <= 1'd0;
            end
        end else /*if(en)*/ begin
            for(row_en=1;row_en<DIM;row_en++)begin
                true_en[row_en] <= true_en[row_en-1];
            end
            true_en[0] <= en;
        end
    end

  genvar row_Aouts;
  generate
        for(row_Aouts=0;row_Aouts<DIM;row_Aouts++)begin
            assign Aout[row_Aouts] = true_en[row_Aouts]?Aouts[row_Aouts]:0;
        end
  endgenerate

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