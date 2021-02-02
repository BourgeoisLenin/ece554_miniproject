// Spec v1.1
module tpumac
 #(parameter BITS_AB=8,
   parameter BITS_C=16)
  (
   input clk, rst_n, WrEn, en,
   input signed [BITS_AB-1:0] Ain,
   input signed [BITS_AB-1:0] Bin,
   input signed [BITS_C-1:0] Cin,
   output reg signed [BITS_AB-1:0] Aout,
   output reg signed [BITS_AB-1:0] Bout,
   output reg signed [BITS_C-1:0] Cout
  );

  logic [BITS_C-1:0] mult;
  logic [BITS_C-1:0] add;
  logic [BITS_C-1:0] Csel;

  
        assign mult = Ain*Bin;
        assign add = mult+Cout;
        assign Csel = WrEn?Cin:add;

    always_ff@(posedge clk, negedge rst_n) begin
        if(!rst_n)begin
            Aout <= 0;
            Bout <= 0;
            Cout <= 0;
        end
        //mult <= Ain*Bin;
        //add <= mult+Cout;
        /*
        if(WrEn)
            Csel <= Cin;
        else 
            Csel <= add;
            */

        if(en)begin
            Aout <= Ain;
            Bout <= Bin;
            Cout <= Csel;
        end

    end
endmodule

// NOTE: added register enable in v1.1
// Also, Modelsim prefers "reg signed" over "signed reg"