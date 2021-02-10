// My testbenching skill still needs some improvement. I am not confident enough to write
// an automatic test bench. But I try to do it next time and chagne this one into automatic in my leisure.
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
    memA DUT1 (.clk(clk),.rst_n(rst_n),.en(en),.WrEn(WrEn),.Ain(Ain),.Arow(Arow),.Aout(Aout));

    logic signed [BITS_AB-1:0] A [DIM-1:0][DIM-1:0];
    logic signed [BITS_AB-1:0] B [DIM-1:0][DIM-1:0];
    integer error;
    integer Row,Col;
    integer a;

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
        for(a=0;a<DIM;a++)begin
            Bin = B[a];
            @(posedge clk)begin end
            
        end
            Arow = 3'h0;
            WrEn = 1'd1;
            Ain = A[0];
        @(posedge clk) begin end
            Arow = 3'h1;
            WrEn = 1'd1;
            Ain = A[1];
        @(posedge clk) begin end/*
            Bin[0] = 0;
            Bin[1] = 0;
            Bin[2] = 0;
            Bin[3] = 0;
            Bin[4] = 0;
            Bin[5] = 0;
            Bin[6] = 0;
            Bin[7] = 0;*/
            Arow = 3'h2;
            WrEn = 1'd1;
            Ain = A[2];
        @(posedge clk) begin end
      
            Arow = 3'h3;
            WrEn = 1'd1;
            Ain = A[3];
        @(posedge clk) begin end
         
            Arow = 3'h4;
            WrEn = 1'd1;
            Ain = A[4];
        @(posedge clk) begin end
          
            Arow = 3'h5;
            WrEn = 1'd1;
            Ain = A[5];
        @(posedge clk) begin end
     
            Arow = 3'h6;
            WrEn = 1'd1;
            Ain = A[6];
        @(posedge clk) begin end

            Arow = 3'h7;
            WrEn = 1'd1;
            Ain = A[7];  
        @(posedge clk) begin end
            WrEn = 1'd0;

            Arow = 3'h0;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0};    
        @(posedge clk) begin end
            Arow = 3'h1;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0}; 
        @(posedge clk) begin end
            Arow = 3'h2;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0}; 
        @(posedge clk) begin end
            Arow = 3'h3;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0};   
        @(posedge clk) begin end    
            Arow = 3'h4;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0};  

        @(posedge clk) begin end
            Arow = 3'h5;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0};  
        @(posedge clk) begin end
            Arow = 3'h6;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0}; 
        @(posedge clk) begin end
            Arow = 3'h7;
            WrEn = 1'd1;
            Ain = {0,0,0,0,0,0,0,0};   
        @(posedge clk) begin end
            WrEn = 1'd0;
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        @(posedge clk) begin end
        en = 1'b0;

        $stop;

    end

endmodule