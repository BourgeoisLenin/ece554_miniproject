// FIFO Testbench

module tpumac_tb();

	// Clock
	logic clk;
	logic rst_n;
	logic en;
    logic WrEn;
    bit signed [7:0] A [8:0];
    bit signed [7:0] B [8:0];
    bit signed [15:0] Cinter [8:0];

    bit signed [7:0] Ain;
    bit signed [7:0] Bin;
    bit signed [7:0] Aout;
    bit signed [7:0] Bout;
    bit signed [15:0] Cin;
    bit signed [15:0] Cout;


	always #5 clk = ~clk; 



	integer errors;
	integer lind;

	tpumac DUT(.clk(clk), .rst_n(rst_n), .en(en),
	        .WrEn(WrEn),
            .Ain(Ain),
            .Bin(Bin),
            .Cin(Cin),
            .Aout(Aout),
            .Bout(Bout),
            .Cout(Cout));

	initial begin
		clk = 1'b0;
		rst_n = 1'b0;
		en = 1'b0;
        WrEn = 1'b1;
		errors = 0;


		// Set stimulus values
		A[0] = 8'd 1;
        A[1] = 8'd 2;
        A[2] = 8'd 3;
        A[3] = 8'd 4;
        A[4] = 8'd 5;
        A[5] = 8'd 6;
        A[6] = 8'd 7;
        A[7] = 8'd 8;

        B[0] = 8'd 1;
        B[1] = 8'd 2;
        B[2] = 8'd 3;
        B[3] = 8'd 4;
        B[4] = 8'd 5;
        B[5] = 8'd 6;
        B[6] = 8'd 7;
        B[7] = 8'd 8;

        Cinter[0] = 16'd 0;
        Cinter[1] = 16'd 1;
        Cinter[2] = 16'd 5;
        Cinter[3] = 16'd 14;
        Cinter[4] = 16'd 30;
        Cinter[5] = 16'd 55;
        Cinter[6] = 16'd 91;
        Cinter[7] = 16'd 140;
        Cinter[8] = 16'd 204;

		// Load stimulti for our DUT
		@(posedge clk);
		rst_n = 1'b1;
		en = 1'b1;
        WrEn = 1'b0;
        
		for(lind = 0; lind < 9; ++lind) begin
			Ain = A[lind];
            Bin = B[lind];

			// We should also check for the reset during each of
			// these
			#1 if(Cout !== Cinter[lind]) begin
				errors++;
				$display("Error! Reset was not conducted properly. Expected: %d, Got: %d", Cinter[lind],Cout); 
			end

			@(posedge clk);
		end

		if(!errors) begin
			$display("YAHOO!!! All tests passed.");
		end
		else begin
			$display("ARRRR!  Ye codes be blast! Aye, there be errors. Get debugging!");
		end

		$stop;

	end

endmodule
