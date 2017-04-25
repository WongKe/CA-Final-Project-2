// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for 32 bit adder.

module Adder(in0, in1, out);
  input [31:0] in0, in1;    // Input [31-0]
  output reg [31:0] out;    // Output [1-0]
  
  // Adder Operation
  always @ (in0 or in1) begin
    out = in0 + in1;
  end
  
endmodule
