// FIFO Testbench

module fifo_tb();

	// Clock
	logic clk;
	logic rst_n;
	logic en;
	logic [63:0] d;
	logic [63:0] q;

	always #5 clk = ~clk; 

	fifo DUT(.clk(clk), .rst_n(rst_n), .en(en),
	        .d(d), .q(q));

	initial begin
		clk = 1'b0;
		rst_n = 1'b0;
		en = 1'b0;

		// Load stimulti for our DUT
		@(posedge clk);
		rst_n = 1'b1;
		en = 1'b1;

		// Input. Then stop.
		d = 64'd1;
		@(posedge clk);
		d = -64'd8;
		@(posedge clk);
		d = -64'd3;
		@(posedge clk);
		d = 64'd16457;
		@(posedge clk);
		d = 64'd89320567;
		@(posedge clk);
		d = 64'd58947128924718;
		@(posedge clk);
		d = -64'd123567;
		@(posedge clk);
		d = 64'd55;
		@(posedge clk);
		repeat (10) @(posedge clk);
		
		// Disable enable
		en = 1'b0;

	end

endmodule
