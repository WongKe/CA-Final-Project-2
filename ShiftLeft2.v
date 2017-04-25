// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for Shift Left 2

`timescale 1ns/1ns

module ShiftLeft2(in, out);
  
  input [31:0] in;       // Uses output of sign extend as input
  output reg [31:0] out; // Shift Left 2 Output
  
  //ShiftLeft2 Operation
  always @ (in) begin
    // Add two zeros at the end. Ignore first 2 bits.
    out = {in[29:0], 2'b00};
  end
endmodule  
