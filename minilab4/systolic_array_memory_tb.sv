`include "systolic_array_memory_tc.svh"

module systolic_array_memory_tb ();
    localparam BITS_AB=8;
    localparam BITS_C=16;
    localparam DIM=8;
    localparam ROWBITS=$clog2(DIM);
   
    localparam TESTS=10;
   
endmodule