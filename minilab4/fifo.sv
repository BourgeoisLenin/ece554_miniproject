// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=8,
  parameter BITS=8
  )
  (
  input clk,rst_n,en,
  input stall,
  input [BITS-1:0] d,
  output [BITS-1:0] q
  );
  
  // your RTL code here
  reg [BITS-1:0] fifo_out [DEPTH-1:0];
  integer i;
  integer x;

  always@(posedge clk) begin
    if (!rst_n)
      for ( x= 0; x<DEPTH; x++ ) begin
        fifo_out[x] <= 0;
      end
    else if (en&&!stall) begin  
      fifo_out[0][BITS-1:0] <= d;
      for ( i= 1; i<DEPTH; i++ ) begin
        fifo_out[i][BITS-1:0] <= fifo_out[i-1][BITS-1:0];
      end  
    end

  end

  assign q = stall?0:fifo_out[DEPTH-1];

endmodule // fifo
