
module transpose_fifo
  #(
  parameter DEPTH=8,
  parameter BITS=8
  )
  (
  input clk,rst_n,en, WrEn,
  input  [BITS-1:0] d [DEPTH-1:0],
  input stall,
  output [BITS-1:0] q
  );
  // your RTL code here
  reg [BITS-1:0] fifo_out [DEPTH-1:0];
  integer i;
  integer x;
/*
  always@(rst_n) begin
    if (!rst_n)
      for ( x= 0; x<DEPTH; x=x+1 ) begin
        fifo_out[x] <= 64'd0;
      end
  end
*/
  always@(posedge clk) begin
    if (!rst_n)
      for ( x= 0; x<DEPTH; x=x+1 ) begin
        fifo_out[x] <= 64'd0;
      end
    else if (WrEn) begin
        fifo_out <= d;
    end
    else if (en&&!stall) begin
      for ( i= 0; i<DEPTH-1; i=i+1 ) begin
        fifo_out[i][BITS-1:0] <= fifo_out[i+1][BITS-1:0];
      end
    
    end

  end

  assign q =stall?0:fifo_out[0];

endmodule // fifo_transpose
