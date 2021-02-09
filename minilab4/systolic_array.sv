module systolic_array
#(
   parameter BITS_AB=8,
   parameter BITS_C=16,
   parameter DIM=8
   )
  (
   input clk,rst_n,WrEn,en,
   input signed [BITS_AB-1:0] A [DIM-1:0],
   input signed [BITS_AB-1:0] B [DIM-1:0],
   input signed [BITS_C-1:0]  Cin [DIM-1:0],
   input [$clog2(DIM)-1:0]    Crow,
   output signed [BITS_C-1:0] Cout [DIM-1:0]
   );

    integer x;
    logic WrEnRows [DIM-1:0];

    logic signed [BITS_AB-1:0] Ainter [DIM-1:0][DIM:0];
    logic signed [BITS_AB-1:0] Binter [DIM:0][DIM-1:0];
    logic signed [BITS_C-1:0] Couts [DIM-1:0][DIM-1:0];
    logic signed [BITS_C-1:0] Cins [DIM-1:0][DIM-1:0];

    assign Ainter[0][0] = A[0];
    assign Ainter[1][0] = A[1];
    assign Ainter[2][0] = A[2];
    assign Ainter[3][0] = A[3];
    assign Ainter[4][0] = A[4];
    assign Ainter[5][0] = A[5];
    assign Ainter[6][0] = A[6];
    assign Ainter[7][0] = A[7];

    assign Binter[0][0] = B[0];
    assign Binter[0][1] = B[1];
    assign Binter[0][2] = B[2];
    assign Binter[0][3] = B[3];
    assign Binter[0][4] = B[4];
    assign Binter[0][5] = B[5];
    assign Binter[0][6] = B[6];
    assign Binter[0][7] = B[7];

    assign Cout = Couts[Crow];

    genvar row,col;
    generate
        for (row=0;row<DIM;row++) begin
            for(col=0;col<DIM;col++) begin
                tpumac mac0(
                    .clk(clk), .rst_n(rst_n), .WrEn(WrEnRows[row]), .en(en),
                    .Ain(Ainter[row][col]),
                    .Bin(Binter[row][col]),
                    .Cin(Cin[col]),
                    .Aout(Ainter[row][col+1]),
                    .Bout(Binter[row+1][col]),
                    .Cout(Couts[row][col])); 
            end
        end
    endgenerate

    always_comb begin
        for (x = 0; x < DIM; x++) begin
            if(Crow==x)
                WrEnRows[x] = WrEn;
            else 
                WrEnRows[x] = 1'd0;
        end
    end

endmodule