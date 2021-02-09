module mem_tb();
    localparam BITS_AB=8;
    localparam DIM=8;
    logic clk;
    logic rst_n;
    logic en;
    logic signed [BITS_AB-1:0] Bin [DIM-1:0];
    logic signed [BITS_AB-1:0] Bout [DIM-1:0];
    logic signed [BITS_AB-1:0] Ain [DIM-1:0];
    logic signed [BITS_AB-1:0] Aout [DIM-1:0];
    logic [$clog2(DIM)-1:0] Arow;
    logic signed WrEn;

    always #5 clk = ~clk; 

    memB DUT (.clk(clk),.rst_n(rst_n),.en(en),.Bin(Bin),.Bout(Bout));
    //memA DUT1 (.clk(clk),.rst_n(rst_n),.en(en),.WrEn(WrEn),.Ain(Ain),.Arow(Arow),.Aout(Aout));

    logic signed [BITS_AB-1:0] A [DIM-1:0][DIM-1:0];
    logic signed [BITS_AB-1:0] B [DIM-1:0][DIM-1:0];
    integer error;
    integer Row,Col;


    initial begin
        for(Row=0;Row<DIM;Row++) begin
	     for(Col=0;Col<DIM;Col++) begin
            A[Row][Col] = $random;
            B[Row][Col] = $random;
         end
        end
        clk = 1'b0;
        rst_n = 1'd1;
        en = 1'd0;
        WrEn = 1'd0;
        error = 0;
        
        @(posedge clk)begin  end    
            rst_n = 1'b0;
        @(posedge clk) begin end
            rst_n = 1'b1;

        @(posedge clk) begin end
            en = 1'd1;
            Bin = B[0];         

        @(posedge clk) begin end
            Bin = B[1];         

        @(posedge clk) begin end
            Bin = B[2];         

        @(posedge clk) begin end
            Bin = B[3];         

        @(posedge clk) begin end
            Bin = B[4];         

        @(posedge clk) begin end
            Bin = B[5];         

        @(posedge clk) begin end
            Bin = B[6];         

        @(posedge clk) begin end
            Bin = B[7];     
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end

        $stop;

    end

endmodule