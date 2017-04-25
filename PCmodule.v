// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// PC module

module PCmodule(in, clk, rstPC, out);
  
  input [31:0] in;
  input clk, rstPC;
  output reg [31:0] out;
  
  // Output and Reset Case
  always @ (posedge clk or posedge rstPC) begin
    if (rstPC)
      out <= 12288; //Given in assignment 0x00003000
    else
      out <= in;
  end
  
endmodule
