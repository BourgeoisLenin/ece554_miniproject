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

  logic signed [BITS_C-1:0] mult;
  logic signed [BITS_C-1:0] add;

    always_ff@(posedge clk, negedge rst_n) begin
        if(!rst_n)begin
            Aout <= 0;
            Bout <= 0;
        end
        else if(en)begin
            Aout <= Ain;
            Bout <= Bin;
        end
    end

    always_ff@(posedge clk, negedge rst_n) begin
        if(!rst_n)begin
            Cout <= 0;
        end
        else if(WrEn)
            Cout <= Cin;
        else if (en)
            Cout <= add;
    end
    
    always_comb begin
        mult = Ain * Bin;
        add =  mult + Cout;
    end

endmodule

// NOTE: added register enable in v1.1
// Also, Modelsim prefers "reg signed" over "signed reg"