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

  signed logic WrEn_sel[DIM-1:0];

    genvar row;
    generate
      for(row=0;row<DIM;row++)begin
        
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