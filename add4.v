// EECE3324 
// Computer Architecture
// Final Project
// Kevin Wong & Jonathan Marrero

// Module for Add4. 
// Adds 4 to input.

module Add4(in, out);
  input [31:0] in;          // Input [31-0]
  output reg [31:0] out;    // Output [31-0]
  
  // Add 4 operation
  always @ (in) begin
    out = in + 4;
  end
  
endmodule
