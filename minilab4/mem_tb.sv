module mem_tb();
    localparam BITS_AB = 8;
    localparam BITS_C = 16;
    localparam DIM = 8;
    localparam ROWBITS = $clog2(DIM);
    
    logic clk, rst_n, WrEn, en;
    logic signed [BITS_AB-1:0] Ain [DIM-1:0], Bin [DIM-1:0];
    logic [$clog2(DIM)-1:0] Arow;
    logic signed [BITS_AB-1:0] Aout [DIM-1:0], Bout [DIM-1:0];

    logic signed [BITS_AB-1:0] memAData [DIM-1:0][DIM*2-1:0], memBData [DIM*2-1:0][DIM-1:0];
    initial clk = 0;
    always #5 clk = ~clk;
        
    memA memADUT
    (
    .clk(clk), .rst_n(rst_n), .WrEn(WrEn), .en(en),
    .Ain(Ain), .Arow(Arow), .Aout(Aout)
    );

    memB memBDUT
    (
    .clk(clk), .rst_n(rst_n), .WrEn(WrEn), .en(en),
    .Bin(Bin), .Bout(Bout)
    );

    initial begin
        for (int i = 0 ; i < DIM ; i++) begin
            for (int j = 0 ; j < DIM*2 ; j++) begin
                if (j > DIM-1-i && j <= DIM*2-1-i) memAData[i][j] = $urandom;
                else memAData[i][j] = 0;
            end
        end

        $display("-------------------------------------");
        $display("Below is Adata");
        for (int i = 0 ; i < BITS_AB ; i++) begin
            for (int j = 0 ; j < BITS_AB ; j++) begin
                    $write("%h,", Adata[i][j]);
            end
            $write("\n");
        end
        
    end

endmodule
